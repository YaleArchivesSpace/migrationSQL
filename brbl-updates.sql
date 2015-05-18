use brbl_at;

/* move userDefinedText1 to inventory column */
update Accessions
set inventory = userDefinedText1
where userDefinedText1 is not null;

/* and then delete userDefinedText1 from the database. */
update Accessions
set userDefinedText1 = null
where userDefinedText1 is not null;

/*step 1 (fixing up Accession stuf)*/
update Accessions
set accessionProcessedDate = '2012-01-01'
 where accessionProcessed = 1 and accessionProcessedDate is null;

 
 /*step 2*/
 update Accessions
 set userDefinedDate2 = accessionProcessedDate
 where accessionProcessedDate is not null;

 
 /* step 3*/
 update Accessions
 set accessionProcessed = null,
 accessionProcessedDate = null;

/* Update levels */
use brbl_at;
update resourcesComponents
set resourceLevel='file'
where resourceLevel='fonds'
or resourceLevel='class'
or resourceLevel='collection';

update resourcesComponents
set otherLevel='',
resourceLevel='file'
where resourceLevel='otherlevel'
and otherLevel='';

update resourcesComponents
set otherLevel='accession'
where otherLevel='Acquisition'
or otherLevel='Acqusition'
or otherLevel='accessions'
or otherLevel='accesion';

update resourcesComponents
set otherLevel='',
resourceLevel='file'
where resourceLevel='otherlevel'
and (otherLevel='Heading'
or otherLevel='heading'
or otherLevel='subheadings'
or otherLevel='Subheading'
or otherLevel='subgroup'
or otherLevel='section'
or otherLevel='subset');

update resourcesComponents
set otherLevel='',
resourceLevel='series'
where resourceLevel='otherlevel'
and (otherLevel='Oversize'
or otherLevel='RestrictedFragile'
or otherLevel='restricted');


