package TestApp::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
   schema_class => 'TestApp::DBSchema',
   connect_info => [
     'dbi:SQLite:t/var/testapp.db',
     '',
     '',
   ],
);

=head1 NAME

TestApp::Model::DB - Catalyst DBIC Schema Model

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
