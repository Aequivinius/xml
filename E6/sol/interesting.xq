<articles>
{
let $med-doc := doc('medsamp2016.xml')
let $int-doc := doc('interesting-articles.xml')
for $citation in $med-doc/MedlineCitationSet/MedlineCitation
where $citation/PMID = $int-doc/articles/article/@PMID
return
<article PMID="{$citation/PMID}">
{string-join($citation/KeywordList/Keyword,',')}
</article>
}
</articles>