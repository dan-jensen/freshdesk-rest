# Changelog

The following changes have been made to the library. Please add an entry to this file as part of your pull requests.

#### Version 2.0.0
- Add Client class as a replacement for Factory class to create an api client as an instance instead of static class, so it would be possible to have several api objects for different Freshdesk accounts
- Deprecate Factory class

#### Version 0.1.5
- Add solutions folders resource #list
- Add solutions categories resource #list
- Add solutions articles resource #get #list #search
- Add missing require uri in contact so spec pass when running it isolated
- Updates mime-types from 3.2.2 to 3.4.1
- Update bundler from 1.16.2 to 2.3.10

#### Version 0.1.4

- Fix **Ticket resource** missing require

#### Version 0.1.3

- **Ticket resource** added: post

#### Version 0.1.2

- Allow GET to raise RestClient::NotFound exception on 404 status

#### Version 0.1.1

- Fix gem metadata

#### Version 0.1.0

- INITIAL RELEASE
- **Contact resource** added: list, get, post, put, delete
