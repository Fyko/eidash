use std::env;
use std::path::PathBuf;

fn main() {
    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());

    // Build gRPC bits from proto file
    let build = tonic_build::configure()
        .file_descriptor_set_path(out_dir.join("ei_descriptor.bin"))
        .out_dir("src/")
        .build_client(true)
        .compile(&["./proto/ei.proto"], &["./proto"]);

    if let Err(e) = build {
        let inner = e.to_string();
        eprintln!("Failed to compile protos:\n\n{}", inner);
        std::process::exit(1);
    }
}
