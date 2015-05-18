# move userDefinedText1 to inventory column
update accessions
set inventory = userDefinedText1
where userDefinedText1 is not null;
#and then delete userDefinedText1 from the database.
update accessions
set userDefinedText1 = null
where userDefinedText1 is not null;
