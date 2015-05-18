# migrationSQL
sql scripts to help support Yale's migration

1. Pre-migration script AllDatabasesPreMigration.sql
  * Changes NS2 to xlink
  * Removes string "series" from identifiers
  * Trims identifiers and barcodes (cleaning up whitespace)
  * Changes Roman numerals to Arabic
  * Changes all container types to "Mixed Materials"
2. Script to bring user and date information from accession table in AT UpdatingAccessionAuditTrail.sql
3. Identifier clean-up script for those already in ASpace PostMigrationIndentifierCleanUp.sql
4. Fauxcodes for repositories that may have distinct containers with the same container indicator in a resource. There's also a bit of crappy logic to accommodate our "common slide" boxes, which are shared across resources. FauxCodes.sql
