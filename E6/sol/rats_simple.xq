<results>
{
for $rat-citation in doc('medsamp2016.xml')/MedlineCitationSet/MedlineCitation[contains(Article/Abstract/AbstractText[1],'rats')]
order by $rat-citation//PubDate/Year descending
return $rat-citation/Article/ArticleTitle
}
</results>