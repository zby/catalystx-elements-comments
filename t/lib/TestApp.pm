package TestApp;
use Moose;
use namespace::autoclean;

use Catalyst qw/
/;
extends 'Catalyst';

__PACKAGE__->config();

__PACKAGE__->setup;

__PACKAGE__->meta->make_immutable( replace_constructor => 1 );

