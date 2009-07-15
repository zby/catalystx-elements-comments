package CatalystX::Elements::Comments::Form;

use HTML::FormHandler::Moose;

extends 'CatalystX::Elements::Comments::BaseForm';

has_field 'name' => (
      required => 1,
      label    => 'Name',
      size     => 25
);

has_field 'email' => ( 
     label => 'Email',   
     size => 25 );

has_field 'url' => ( 
     label => 'Website', 
     size => 25 );

no HTML::FormHandler::Moose;
1;

=head1 NAME

CatalystX::Elements::Comments::Form

