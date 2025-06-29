# Restore Manager

A powerful command-line tool to snapshot and restore the state of your local directories.

`restore-manager` helps you protect your work from accidental changes, renames, moves, or deletions by creating intelligent snapshots of your files and their unique identifiers. It can then perfectly restore your directory to a previous state.

## Features

-   **UUID-based Tracking**: Assigns persistent Unique IDs (UUIDs) to files using extended attributes (`xattr`), allowing the tool to track files even if they are renamed or moved.
-   **Snapshot Creation**: Creates timestamped, human-readable `.restore-*.md` snapshot files containing file metadata and (for text-editable files) their content.
-   **Intelligent Restoration**: Restores files to their original locations, recreates deleted files from saved content, and handles renamed/moved files gracefully.
-   **Flexible Backup Options**: Supports excluding all subfolders, specific subfolders, or including only specified subfolders during backup.
-   **Interactive Mode**: A user-friendly conversational interface for quick backups and restores.
-   **Command-Line Interface (CLI)**: Full support for command-line arguments for scripting and automation.

## Installation

### Prerequisites

-   Python 3.8 or higher.
-   `xattr` library: This tool relies on extended file attributes, which are common on macOS and Linux. You'll need the `xattr` Python library.

    ```bash
    pip install xattr
    ```

### Using the Setup Script (Recommended)

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/brookcs3/restore-manager.git
    cd restore-manager
    ```

2.  **Run the setup script:** This script will install `restore-manager` globally using `pip`.
    ```bash
    chmod +x setup.sh
    sudo ./setup.sh
    ```
    You may be prompted for your password to allow global installation.

### Manual Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/brookcs3/restore-manager.git
    cd restore-manager
    ```

2.  **Install using pip:**
    ```bash
    pip install .
    ```
    If you want to install it globally for all users, you might need `sudo pip install .`.

## Usage

Once installed, you can run `restore-manager` from any directory.

### Interactive Mode

Run `restore-manager` without any arguments to enter the interactive, conversational mode:

```bash
restore-manager
```

Follow the prompts to backup or restore your current directory.

### Command-Line Arguments

#### Backup

To create a snapshot of the current directory:

```bash
restore-manager backup [options]
```

**Options:**

-   `-xf`, `--exclude-all-subfolders`: Backs up only the files in the root of the current directory, excluding all subfolders.
-   `-xfs PATH [PATH ...]`, `--exclude-specific-subfolders PATH [PATH ...]`: Excludes specific subfolders from the backup. Provide paths relative to the current directory.
    Example: `restore-manager backup -xfs node_modules build`
-   `-s PATH [PATH ...]`, `--include-specific-subfolders PATH [PATH ...]`: Includes only files within the specified subfolders (and files in the root directory). Provide paths relative to the current directory.
    Example: `restore-manager backup -s src docs`

#### Restore

To restore the current directory from a previously created snapshot:

```bash
restore-manager restore
```

If multiple `.restore-*.md` files are found, the tool will list them and ask you to choose which snapshot to restore from.

## How It Works

`restore-manager` leverages `xattr` (extended attributes) to assign a unique UUID to each file it tracks. When you create a snapshot, it records:

-   The file's UUID.
-   Its relative path within the directory.
-   Its size.
-   Its content (for text-editable files, base64 encoded).

During restoration, the tool compares the current state of the directory with the snapshot. It uses the UUIDs to identify files that have been moved or renamed, recreates deleted files using their saved content, and ensures the directory structure matches the snapshot.

## Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. (Note: You'll need to create a LICENSE file in your repository if you haven't already.)
