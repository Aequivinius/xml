<authors>
{
let $doc := doc('medsamp2016-indented.xml')
let $authors := $doc/distinct-values(//Author[@ValidYN='Y']/LastName)
for $author in $authors
order by $author
return
	<author name="{$author}">
	{
	let $citations := $doc/MedlineCitationSet/MedlineCitation[Article/AuthorList/Author/LastName = $author]
	for $citation in $citations
	order by $citation/Article/Journal/JournalIssue/PubDate/Year
	return
		<citation title="{$citation/Article/ArticleTitle}" year="{$citation/Article/Journal/JournalIssue/PubDate/Year}"/>
	}
</author>
}
</authors>