package TestApp::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { 
    extends 'Catalyst::Controller';
}
with 'CatalystX::Elements::Comments';

__PACKAGE__->config(namespace => '');

has model_name => ( is => 'ro', isa => 'Str', default => 'DB' );

sub article : Local {
    my ( $self, $c, $id ) = @_;
    $self->stash_comment_form( $c, $id );
}

sub end : Private {
    my ( $self, $c, ) = @_;
    $c->response->body( $c->stash->{comment_form}->render ) if ! length $c->response->body;
}

__PACKAGE__->meta->make_immutable;

