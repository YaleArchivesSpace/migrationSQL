/* in aspace, we've opted not to use the 4th field for accession identifers (and we've even suppressed that field from the interface),
so the few cases where those are used need to be merged with the 3rd field prior to migration */
update cc.Accessions
set accessionNumber3 = concat(accessionNumber3, '-', accessionNumber4)
, accessionNumber4 = ''
where accessionNumber4 <> '';
