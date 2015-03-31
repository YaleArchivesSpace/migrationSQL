/* This looks for any content in user_defined.boolean_1 that is associated with an MSSA accession record, deletes it, and associates it with material_type. *?
/* WORK IN PROGRESS */
use testdb_aspace;
SELECT 
    user_defined.accession_id,
    user_defined.boolean_1,
    accession.id,
    accession.repo_id,
    repository.id,
    repository.repo_code
FROM
    accession 
        JOIN
    repository ON accession.repo_id = repository.id
        JOIN
    user_defined ON user_defined.accession_id = accession.id
WHERE
    repository.repo_code = 'mssa'
        AND user_defined.boolean_1 IS NOT NULL
