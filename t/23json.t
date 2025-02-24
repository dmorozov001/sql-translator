use warnings;
use strict;
use Test::More;
use Test::Exception;
use Test::SQL::Translator qw(maybe_plan);
use SQL::Translator;
use FindBin '$Bin';

BEGIN {
    maybe_plan(
        2,
        'SQL::Translator::Parser::SQLite',
        'SQL::Translator::Producer::JSON',
    );
}

my $sqlt_version = $SQL::Translator::VERSION;
use JSON::MaybeXS 'from_json';
my $json = from_json(<<JSON);
{
   "schema" : {
      "procedures" : {},
      "tables" : {
         "person" : {
            "constraints" : [
               {
                  "deferrable" : 1,
                  "expression" : "",
                  "fields" : [
                     "person_id"
                  ],
                  "match_type" : "",
                  "name" : "",
                  "on_delete" : "",
                  "on_update" : "",
                  "options" : [],
                  "reference_fields" : [],
                  "reference_table" : "",
                  "type" : "PRIMARY KEY"
               },
               {
                  "deferrable" : 1,
                  "expression" : "",
                  "fields" : [
                     "name"
                  ],
                  "match_type" : "",
                  "name" : "u_name",
                  "on_delete" : "",
                  "on_update" : "",
                  "options" : [],
                  "reference_fields" : [],
                  "reference_table" : "",
                  "type" : "UNIQUE"
               }
            ],
            "fields" : {
               "age" : {
                  "data_type" : "integer",
                  "default_value" : null,
                  "is_nullable" : 1,
                  "is_primary_key" : 0,
                  "is_unique" : 0,
                  "name" : "age",
                  "order" : "3",
                  "size" : [
                     "0"
                  ]
               },
               "description" : {
                  "data_type" : "text",
                  "default_value" : null,
                  "is_nullable" : 1,
                  "is_primary_key" : 0,
                  "is_unique" : 0,
                  "name" : "description",
                  "order" : "6",
                  "size" : [
                     "0"
                  ]
               },
               "iq" : {
                  "data_type" : "tinyint",
                  "default_value" : "0",
                  "is_nullable" : 1,
                  "is_primary_key" : 0,
                  "is_unique" : 0,
                  "name" : "iq",
                  "order" : "5",
                  "size" : [
                     "0"
                  ]
               },
               "name" : {
                  "data_type" : "varchar",
                  "default_value" : null,
                  "is_nullable" : 0,
                  "is_primary_key" : 0,
                  "is_unique" : 1,
                  "name" : "name",
                  "order" : "2",
                  "size" : [
                     "20"
                  ]
               },
               "person_id" : {
                  "comments" : [
                    "field comment 1",
                    "field comment 2"
                  ],
                  "data_type" : "INTEGER",
                  "default_value" : null,
                  "is_auto_increment" : 1,
                  "is_nullable" : 0,
                  "is_primary_key" : 1,
                  "is_unique" : 0,
                  "name" : "person_id",
                  "order" : "1",
                  "size" : [
                     "0"
                  ]
               },
               "weight" : {
                  "data_type" : "double",
                  "default_value" : null,
                  "is_nullable" : 1,
                  "is_primary_key" : 0,
                  "is_unique" : 0,
                  "name" : "weight",
                  "order" : "4",
                  "size" : [
                     "11",
                     "2"
                  ]
               }
            },
            "indices" : [],
            "name" : "person",
            "options" : [],
            "order" : "1",
            "comments" : [
               "table comment 1",
               "table comment 2",
               "table comment 3"
             ]
         },
         "pet" : {
            "constraints" : [
               {
                  "deferrable" : 1,
                  "expression" : "",
                  "fields" : [],
                  "match_type" : "",
                  "name" : "",
                  "on_delete" : "",
                  "on_update" : "",
                  "options" : [],
                  "reference_fields" : [],
                  "reference_table" : "",
                  "type" : "CHECK"
               },
               {
                  "deferrable" : 1,
                  "expression" : "",
                  "fields" : [
                     "pet_id",
                     "person_id"
                  ],
                  "match_type" : "",
                  "name" : "",
                  "on_delete" : "",
                  "on_update" : "",
                  "options" : [],
                  "reference_fields" : [],
                  "reference_table" : "",
                  "type" : "PRIMARY KEY"
               },
               {
                  "deferrable" : 1,
                  "expression" : "",
                  "fields" : [
                     "person_id"
                  ],
                  "match_type" : "",
                  "name" : "",
                  "on_delete" : "",
                  "on_update" : "",
                  "options" : [],
                  "reference_fields" : [
                     "person_id"
                  ],
                  "reference_table" : "person",
                  "type" : "FOREIGN KEY"
               }
            ],
            "fields" : {
               "age" : {
                  "data_type" : "int",
                  "default_value" : null,
                  "is_nullable" : 1,
                  "is_primary_key" : 0,
                  "is_unique" : 0,
                  "name" : "age",
                  "order" : "4",
                  "size" : [
                     "0"
                  ]
               },
               "name" : {
                  "data_type" : "varchar",
                  "default_value" : null,
                  "is_nullable" : 1,
                  "is_primary_key" : 0,
                  "is_unique" : 0,
                  "name" : "name",
                  "order" : "3",
                  "size" : [
                     "30"
                  ]
               },
               "person_id" : {
                  "data_type" : "int",
                  "default_value" : null,
                  "is_nullable" : 0,
                  "is_primary_key" : 1,
                  "is_unique" : 0,
                  "name" : "person_id",
                  "order" : "2",
                  "size" : [
                     "0"
                  ]
               },
               "pet_id" : {
                  "data_type" : "int",
                  "default_value" : null,
                  "is_nullable" : 0,
                  "is_primary_key" : 1,
                  "is_unique" : 0,
                  "name" : "pet_id",
                  "order" : "1",
                  "size" : [
                     "0"
                  ]
               }
            },
            "indices" : [],
            "name" : "pet",
            "options" : [],
            "order" : "2"
         }
      },
      "triggers" : {
         "pet_trig" : {
            "action" : {
               "for_each" : null,
               "steps" : [
                  "update pet set name=name"
               ],
               "when" : null
            },
            "database_events" : [
               "insert"
            ],
            "fields" : null,
            "name" : "pet_trig",
            "on_table" : "pet",
            "order" : "1",
            "perform_action_when" : "after",
            "scope": "row"
         }
      },
      "views" : {
         "person_pet" : {
            "fields" : [],
            "name" : "person_pet",
            "order" : "1",
            "sql" : "select pr.person_id, pr.name as person_name, pt.name as pet_name\\n  from   person pr, pet pt\\n  where  person.person_id=pet.pet_id\\n"
         }
      }
   },
   "translator" : {
      "add_drop_table" : 0,
      "filename" : null,
      "no_comments" : 0,
      "parser_args" : {},
      "parser_type" : "SQL::Translator::Parser::SQLite",
      "producer_args" : {
         "canonical" : 1,
         "pretty" : 1,
	 "totally_bogus_arg_to_test_arg_filtering_to_json" : 1
      },
      "producer_type" : "SQL::Translator::Producer::JSON",
      "show_warnings" : 0,
      "trace" : 0,
      "version" : "$sqlt_version"
   }
}
JSON

my $file = "$Bin/data/sqlite/create.sql";
open my $fh, '<', $file or die "Can't read '$file': $!\n";
local $/;
my $data = <$fh>;
my $tr = SQL::Translator->new(
    parser => 'SQLite',
    producer => 'JSON',
    producer_args => {
        canonical => 1,
        pretty => 1,
	totally_bogus_arg_to_test_arg_filtering_to_json => 1,
    },
    data => $data,
);

my $out;
lives_ok { $out = from_json($tr->translate) } 'Translate SQLite to JSON';
is_deeply( $out, $json, 'JSON matches expected' );
