#!/usr/bin/env perl

use strict;
use warnings;
use Test::More 'no_plan';
use HTTP::Request::Common;
use String::Random qw(random_string random_regex);
use autodie;

# setup library path
use FindBin qw($Bin);
use lib "$Bin/lib";

use TestApp::DBSchema;
my $db_file = "$Bin/var/testapp.db";
unlink $db_file if -f $db_file ;
my $schema = TestApp::DBSchema->connect( "dbi:SQLite:$db_file" );
$schema->deploy;

use Catalyst::Test 'TestApp';
my ($res, $c);

my $id = random_regex( '\w{20}' );
my $req = request("/article/$id");
ok( $req->is_success, 'Get /article/id');
like( $req->content, qr/id="comment_form" method="post"/, 'Contains comment form' );
like( $req->content, qr/input type="text" name="comment_form.name"/, 'Form contains name field' );
my $name = random_regex( '\w{20}' );
my $url  = 'http://www.example.com/' . random_regex( '\w{20}' );
my $body = random_regex( '\w{20}' ) . ' ' . random_regex( '\w{20}' );
($res, $c) = ctx_request( 
    POST "http://localhost/article/$id", 
    [ 
        'comment_form.email' => $name . '@aaa.aaa', 
        'comment_form.name' => $name, 
        'comment_form.url' => $url,
        'comment_form.body' => $body,
    ]
);
is($res->code, 302, 'get 302 redirect after POST');
my $comment = $schema->resultset( 'Comment' )->search( 
    { 
        email => $name . '@aaa.aaa', 
        name => $name, 
        url =>  $url,
        body => $body,
        article_id => $id 
    }
)->first;
END { $comment->delete if $comment };
ok( $comment, 'Comment saved' );

