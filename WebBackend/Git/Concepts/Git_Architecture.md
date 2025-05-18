
***Git is not just a command-line tool for code management—it's a content-addressed database optimized for distributed, scalable, and secure development workflows.***


## 1. Core Concepts of Git

Git is a version control system designed to track changes in files and coordinate work across multiple people. However, it does not operate like traditional file-based systems. It is built as a **content-addressable database**, where the content itself—not the filename—is what Git uses to manage everything.

- When you create or modify a file, Git doesn’t just save the file—it stores the **content** in a special database using a **SHA-1 hash**, a long hexadecimal string generated from the content.
    
- This hash becomes the file's identity in Git's database. If the content is the same, the hash will be the same. If the content changes—even by one character—the hash will be completely different.
    
- File names are considered **metadata** (data about data). They are stored in separate objects and are not used to identify the file itself.
    
- This system ensures that Git can track changes **based on actual content**, not just based on file paths or names.
    

---

## 2. Design Features of Git

Git was designed to solve problems that older version control systems struggled with—especially in large, distributed development environments like the Linux kernel.

### 2.1 Distributed Repositories

- In Git, when you **clone** a repository, you’re not just downloading the latest files—you’re getting the **entire project history and internal database**.
    
- The `.git` directory in your local project folder contains **all data, logs, and metadata**. This makes your local repository **fully functional**, even without a network connection.
    
- This is different from centralized systems where the full history exists only on the server.
    

### 2.2 Scalability

- Git stores everything in compressed form and uses **deduplication** by content. Identical content is stored once, even across different files or versions.
    
- Hash-based storage allows Git to handle thousands of contributors and millions of commits without becoming inefficient.
    

### 2.3 Performance and Efficiency

- Git avoids unnecessary copying. Instead of saving whole files repeatedly, it stores only **the parts that change**.
    
- Internal comparisons are done using hash strings rather than scanning large files. This makes operations like `diff`, `status`, and `log` extremely fast.
    

### 2.4 Data Integrity with SHA-1

- SHA-1 hashes are not just IDs—they ensure the content has **not been altered**.
    
- Each commit includes a hash of the file tree, the commit message, and even previous commit hashes—creating a **chain of trust**.
    
- Any change to the content alters the hash, so corruption or unauthorized changes are automatically detectable.
    

### 2.5 Immutability and Accountability

- Once a commit is made, the content and metadata cannot be changed (without rewriting history).
    
- This ensures every change is **permanent and traceable**.
    
- Commits include author names, timestamps, and commit messages, making it easy to audit project history.
    

### 2.6 Atomic Commits

- When you run `git commit`, Git performs an **atomic write**: it creates all the internal objects (blobs, trees, and commits), verifies them, then updates the references (like `HEAD`) in a single, indivisible step.
    
- If any part fails, the entire commit is aborted—leaving the repository in a consistent state.
    

### 2.7 Branching and Merging

- Branches are not folders or copies—they are simply **pointers to specific commits**.
    
- When you create a branch, Git creates a new label pointing to a commit. When you switch branches, Git updates your working directory to match the content of that commit.
    
- Merging finds a **common ancestor** of the branches and compares the differences to combine them safely.
    

---

## 3. Internal Structure of a Git Repository

A Git repository is just a **collection of internal data structures** stored in the `.git/` directory. This includes the full project history, configuration, and metadata.

### 3.1 `.git` Directory

This is where Git stores everything, including:

- **Object Store**: Where content is stored.
    
- **Refs**: Pointers to commits (like branches and tags).
    
- **HEAD**: Points to the current branch or commit.
    
- **Config**: Stores user and repository settings.
    
- **Index**: The staging area, or the "next commit."
    

None of this data is visible in the working directory unless Git recreates it.

---

## 4. Main Components Inside Git

### 4.1 Object Store

The object store is the core of Git’s storage system. It holds four types of objects:

- **Blob**: Stores the raw contents of a file (no name, no path—just the data). When a file changes, Git generates a new blob.
    
- **Tree**: Represents a directory. It contains the names of files, their permissions, and links (hashes) to blobs or other trees.
    
- **Commit**: Represents a snapshot of the project at a point in time. It stores:
    
    - The hash of the root tree (directory),
        
    - Parent commit hashes,
        
    - Author and committer info,
        
    - Commit message.
        
- **Tag**: A human-readable reference to a specific commit, often used to mark releases.
    

All objects are stored as compressed files inside `.git/objects/`, indexed by the first 2 characters of their hash.

### 4.2 Index (Staging Area)

- The index is a binary file that holds a snapshot of the working directory, based on what’s been added using `git add`.
    
- When you commit, Git uses the index to **build a tree object**, and from that tree, it creates a new commit.
    
- The index is **not the working directory**, nor is it the repository—it is the **middle ground**, preparing changes for the next commit.
    

---

## 5. How Git Handles Content and Filenames

Git separates **file names** from **file content**.

- If two files (even in different folders) have the same content, only one blob is created.
    
- Trees are responsible for mapping names and folder structures to blobs.
    
- Git tracks changes by comparing **hashes**. If the hash doesn’t change, Git knows the content hasn’t changed—even if the file name or path does.
    

This makes Git fast and storage-efficient.

---

## 6. Storage and Recovery Process

- When you modify a file and run `git add`, Git:
    
    - Calculates the hash of the file’s content.
        
    - Creates a new blob (if the content is new).
        
    - Updates the index with the new hash.
        
- When you run `git commit`, Git:
    
    - Creates a tree object from the index.
        
    - Creates a commit object linking to the new tree.
        
    - Updates the current branch to point to the new commit.
        
- Even if you **delete all files** from the working directory, Git can restore them using the `.git/objects/` data. Running `git restore .` tells Git to rebuild the working files by reading blobs from the latest commit's tree.

---


## 7. How Hash-Based Storage Works in Git

Git uses **SHA-1 hashes** (Secure Hash Algorithm 1) to uniquely identify and store content. The hash is not just an ID—Git **calculates the hash from the content itself**, which creates a tight bond between the data and its identity. This is what allows Git to track changes so effectively.

---

### 7.1 What Is a Hash?

- A **hash function** takes some input (like file content) and returns a fixed-length string—in Git's case, a **40-character hexadecimal string**.
    
- Git uses SHA-1, which always outputs a 160-bit (40-character) hash, regardless of the input size.
    
- Example:  
    `"Hello World"` → `2ef7bde608ce5404e97d5f042f95f89f1c232871`
    

---

### 7.2 How Git Uses Hashes to Store Data

When you create or modify a file, here’s what happens under the hood:

#### Step 1: Create a Blob Object

- Git creates a **blob object**, which includes:
    
    - A header: e.g. `blob 12` (12 = content size in bytes).
        
    - The actual file content.
        
- These two parts are combined:  
    `blob 12\0Hello World`
    

#### Step 2: Calculate the SHA-1 Hash

- Git runs this blob data through the SHA-1 algorithm.
    
- The result is a **unique identifier (hash)** for the blob:
    
    `2ef7bde608ce5404e97d5f042f95f89f1c232871`
    

#### Step 3: Store the Object in `.git/objects/`

- Git stores the compressed object in the file system:
    
    - It takes the **first two characters** of the hash to name a directory.
        
    - The **remaining 38 characters** become the filename inside that directory.
        
    
    So the file is stored as:
    
    `.git/objects/2e/f7bde608ce5404e97d5f042f95f89f1c232871`
    

---

### 7.3 Why Git Uses Hashes

- **Uniqueness**: If the content is even 1 character different, the hash will change completely.
    
- **Integrity**: The hash is based on the content—if the content is tampered with, the hash won’t match.
    
- **Efficiency**: Git can compare files just by comparing their hashes—no need to scan entire files.
    
- **Deduplication**: If the same file content appears multiple times (even in different locations), Git stores it only once because the hash is the same.
    

---

### 7.4 Git Object Types and Hashing

Git stores all data as objects, each with a type and hash:

| Object Type | What It Stores                     | Hash Based On                                 |
| ----------- | ---------------------------------- | --------------------------------------------- |
| **Blob**    | File content                       | Content only                                  |
| **Tree**    | Directory structure and filenames  | The list of filenames and blob/tree hashes    |
| **Commit**  | Snapshot, metadata, parent commits | The tree hash + metadata + parent commit hash |
| **Tag**     | A reference to a commit            | Tag data and the object it points to          |

Every time you commit:

- Git builds a **tree** by combining file names (from index) with their blob hashes.
    
- Then, Git creates a **commit** object with the hash of that tree, a message, author info, and parent commit.
    
- That whole structure is hashed again to generate a unique commit hash.
    

---

### 7.5 Consequences of Hash-Based Storage

- Git does **not care about file names**—only content.
    
- Changing the content = new hash = new object.
    
- Renaming a file does not create a new blob if the content stays the same.
    
- Git ensures that any corruption or unintended change to a file can be **detected immediately** by re-checking the hash.