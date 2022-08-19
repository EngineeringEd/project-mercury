# README

## Background

This is a template starter project for Ruby on Rails. THe aim of this template is to offer a complete project set up with CI, static analysis and linting. This is achieved by utilising Sorbet, with tapioca, and Rubocop. Sorbet was chosen for its very powerful LSP and static type annotations using the `sig` keyword. Please check the documentation here for more detail on how this works.

https://sorbet.org/docs/sigs

Sorbet also works very well with VSCode. The extension Ruby Sorbet plays very well with this set up.

The project also has Solargraph set up to work well with Rails. While lots of intellisense for DSLs used by Rails is hard to index, Solargraph does a decent job of this by passing the gems you want indexed into the require list in the YAML file. THe idea behind this inclusion is that Solargraph will offer intellisense and code completion for any files not type checked by Sorbet.

## Usage

### Set up
First, create a repository using this template and clone to your machine.

Then, you will need to run bundle install to install all the gems
```bash
$ bundle install
```
If this doesn't work first time, a binstub exists in the project.
```bash
$ ./bin/bundle install
```

### Solargraph
Once this has been done, you should set up Solargraph. To do this, we should first check that it is installed. We can do this by:

```bash
$ solargraph --help
```
Or
```bash
$ ./bin/solargraph --help
```

If you get the help menu back, then the gem is installed. If we run:
```bash
$ solargraph download-core
```
Solargraph will attempt to download documentation for the core ruby library you have installed.
N.B. at time of writing, 2.7 is the latest Ruby with documentation. This starter was written using Ruby 3.1.2 and there were no compatibility problems.

Once this has finished, we should generate documentation for the gems we installed earlier. We can do this by using the command:
```bash
$ yard gems
```
This will generate yard docs for the gems installed, allowing Solargraph to consume them and offer intellisense. If you prefer to use yard docs in your project, you can do this easily. Please see this link to the Solargraph docs https://solargraph.org/guides/yard

After this, we shoudl run the command
```bash
$ solargraph bundle
```
This will convert the docs for Rails, which use RDoc, to yard doc so they can also be consumed by Solargraph. Once this is done, we can move onto the final step.

### Sorbet
The set up for Sorbet usually takes some time. However, the bulk of this has been done by the starter here. The `sorbet` dir contains rbi files that define all of the methods on the gems in the gemfile. If we run the command:
```bash
$ tapioca init
```
The rbi files will be checked against the installed gems and updated (this is way faster than generating them raw).

Once this is done, any files with the comment `# typed: true` at the top will be type checked by Sorbet. Running `srb tc` will type check all the files and give you warnings based on issues.

## Troubleshooting



