[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14247331.svg)](https://doi.org/10.5281/zenodo.14247331) 
[![SWH](https://archive.softwareheritage.org/badge/swh:1:dir:7af2db52c5ea7609704baf3d57c18f20f1394982/)](https://archive.softwareheritage.org/swh:1:dir:7af2db52c5ea7609704baf3d57c18f20f1394982;origin=https://github.com/ThalesGroup/MMS-compiler) 
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/9749/badge)](https://www.bestpractices.dev/projects/9749)

# MMS Compiler

The **MMS Compiler** is a command-line tool which can be used to generate Multimedia Messaging Service (MMS) files based on a predefined set of input files: text, images, audio, video. This tool can be used in Windows or Linux (x86).

## Documentation

Please, read the [Overview](/Overview.pdf) and the [User's Guide](/UserGuide.pdf).

## Installation

If you downloaded the binary release, just unpack it into any directory. After that, you can execute the ```compile.bat``` file to generate the MMS file for each of the available templates. The same ```compile.bat``` can be used as a batch file in Windows or a shell script in Linux.

If you downloaded the source code release, unpack it into any directory. Create the subdirectory ```bin``` under the installation directory and copy the FASM (flat assembler) executable into this subdirectory. The FASM compiler can be downloaded from the [official website](https://flatassembler.net/download.php). If using Linux, ```cd``` to the installation directory and set the execute permissions for the ```compile.bat``` files and the FASM compiler, for example:  
```find . -name compile.bat -exec chmod +x {} \;```  
```chmod +x bin/fasm```

## Contributing

If you are interested in contributing to the MMS Compiler project, start by reading the [Contributing guide](/CONTRIBUTING.md).

## License

The MMS Compiler uses the permissive [BSD 3-Clause License](/LICENSE) which allows you to freely use, modify and redistribute this tool in source and binary forms.
