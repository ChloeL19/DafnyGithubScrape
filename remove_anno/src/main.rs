use std::env;
use std::fs::{self, File};
use std::io::{self, BufRead, Write};
use std::path::{Path, PathBuf};

fn main() -> io::Result<()> {
    // Get the file path from command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {} <path_to_file>", args[0]);
        std::process::exit(1);
    }
    let file_path_str = &args[1];
    let file_path = Path::new(file_path_str);

    // Validate file path
    if !file_path.exists() || !file_path.is_file() {
        eprintln!("The provided path does not exist or is not a file.");
        std::process::exit(1);
    }

    // Attempt to open the file
    let input = File::open(file_path)?;
    let buffered = io::BufReader::new(input);

    // Construct the output file path
    let clean_examples_dir = file_path.parent().unwrap().parent().unwrap().join("no_anno");
    fs::create_dir_all(&clean_examples_dir)?;

    let file_stem = file_path.file_stem().unwrap().to_str().unwrap();
    let output_file_name = format!("{}.cleaned.dfy", file_stem);
    let output_path = clean_examples_dir.join(output_file_name);

    let mut output = File::create(&output_path)?;

    let mut skip_annotations = false;

    // Process each line of the file
    for line in buffered.lines() {
        let line = line?;

        // Check if line contains a header indicating the start of a block
        if line.trim().starts_with("predicate") || line.trim().starts_with("method")
            || line.trim().starts_with("function") || line.trim().starts_with("lemma")
            || line.trim().starts_with("constructor") || line.trim().starts_with("class") {
            writeln!(output, "{}", line)?;
            skip_annotations = true;
        }

        if skip_annotations {
            // Skip lines until the opening '{' is found
            if line.contains('{') {
                skip_annotations = false;
                // Write only the line containing the opening '{' to include the function signature
                writeln!(output, "{}", line)?;
            }
            continue;
        }

        // Normal processing, write the line
        writeln!(output, "{}", line)?;
    }

    Ok(())
}
