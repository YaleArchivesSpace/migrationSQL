/* This looks for any content in user_defined.boolean_1 that is associated with an MSSA accession record, deletes it, and associates it with material_type. *?
/* WORK IN PROGRESS */
use testdb_aspace;
Insert into material_types (accession_id, electronic_documents)
select accession_id, '1' from user_defined 
join accession on user_defined.accession_id = accession.id
join repository ON accession.repo_id = repository.id
where user_defined.boolean_1 is not null 
and repository.repo_code = 'mssa';
