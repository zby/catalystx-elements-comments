package TestApp::DBSchema::Result::Comment;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components( 'PK::Auto', 'TimeStamp', 'InflateColumn::DateTime', 'Core' );
__PACKAGE__->table('comments');
__PACKAGE__->add_columns(
   'comment_id',
   {
      data_type         => 'integer',
      is_auto_increment => 1,
      default_value     => undef,
      is_nullable       => 0,
   },
   'name',
   {
      data_type     => 'character varying',
      default_value => undef,
      is_nullable   => 1,
      size          => 255,
   },
   'email',
   {
      data_type     => 'character varying',
      default_value => undef,
      is_nullable   => 1,
      size          => 255,
   },
   'url',
   {
      data_type     => 'character varying',
      default_value => undef,
      is_nullable   => 1,
      size          => 255,
   },
   'body',
   {
      data_type     => 'text',
      default_value => undef,
      is_nullable   => 1,
      size          => undef,
   },
   'remote_ip',
   {
      data_type     => 'character varying',
      default_value => undef,
      is_nullable   => 1,
      size          => 32,
   },
  't_created',
   {
     data_type => 'timestamp',
     default_value => undef,
     is_nullable => 1,
     size => undef,
     set_on_create => 1,
   },
   article_id => { data_type => 'integer', default_value => undef, is_nullable => 1, size => 4 },
   user_id => { data_type => 'integer', default_value => undef, is_nullable => 1, size => 4 },
);



__PACKAGE__->set_primary_key("comment_id");


1;

