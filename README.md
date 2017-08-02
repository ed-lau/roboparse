# R OBO Parser v.0.0.1

R OBO is a simple, naive parser for term attributes in OBO v.1.2 ontology files such as found on Bioportal.

OBO is text file  used by OBO-edit for viewing and editing ontologies. See [here](http://owlcollab.github.io/oboformat/doc/GO.format.obo-1_2.html) for definition.

## Getting Started

Source and use the readOboFile function. The function has two arguments, the first is the a character vector from readLines() of an .obo file. Second is a character list of term attributes to read. At the moment roboparse only takes in the last value if multiple attributes with identical names exist within each Term.


### Prerequisites

roboparse requires the following:

```
R v.3.3.3 or above

```


## Contributing

Please contact us if you wish to contribute, and submit pull requests to us.


## Versioning

We use [SemVer](http://semver.org/) for versioning.


## Authors

* **Edward Lau, PhD** - *Code* - [ed-lau](https://github.com/ed-lau)

See also the list of [contributors](https://github.com/ed-lau/roboparse/graphs/contributors) who participated in this project.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


## Acknowledgments

* [PurpleBooth](https://github.com/PurpleBooth) for Github Readme template.




