use inc::Module::Install;

name     'CatalystX-Elements-Comments';
all_from 'lib/CatalystX/Elements/Comments.pm';
author   'Zbigniew Lukasiak <<zz bb yy @ gmail.com>>';
license  'perl';

requires 'Moose';
requires 'Catalyst::Runtime' => '5.80005';
requires 'HTML::FormHandler';
requires 'HTML::FormHandler::Model::DBIC';
requires 'HTML::FormHandler::Render::Simple';

test_requires 'Test::More';
test_requires 'autodie';
test_requires 'HTTP::Request::Common';
test_requires 'String::Random';


auto_install;

WriteAll;

