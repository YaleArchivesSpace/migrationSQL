/* This script looks for event records associated with BRBL accessions and changes their type from 'processed' to 'accession updated' */
/* WORK IN PROGRESS */
use testdb_aspace;
UPDATE event
        INNER JOIN
    event_link_rlshp ON event.id = event_link_rlshp.event_id
        INNER JOIN
    accession ON accession.id = event_link_rlshp.accession_id
        INNER JOIN
    repository ON accession.repo_id = repository.id
        INNER JOIN
    enumeration_value ON enumeration_value.id = event.event_type_id 
SET 
    event_type_id = CASE
        WHEN enumeration_value.value = 'accession_completed' THEN enumeration_value.id
        ELSE event_type_id
    END
WHERE
    enumeration_value.value = 'processed'
        AND repository.repo_code = 'brbl'
        AND event_link_rlshp.accession_id IS NOT NULL
