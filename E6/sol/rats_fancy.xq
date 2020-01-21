(: Saxon doesn't support the document function, using doc() :)
for $s in doc("medsamp2016.xml")/MedlineCitationSet/MedlineCitation

(: if you don't use /text(), it will select the node, including <enclosingTags></enclosingTags> :)
let $l := $s//Journal/JournalIssue/PubDate/Year/text()
let $m := $s//Abstract/AbstractText
let $t := $s//ArticleTitle/text()

(: this is the correct syntax: some x in y satisfies (condition) :)
where some $a in $m satisfies (contains($a,'rats'))

(: note the descending :)
order by $l descending
return

(: well-formed XML has one root :)
(: to use variables from XQuery, use curly braces :)
	<results> 
		<MedlineCitation>
			<title>{$t}</title>
			<year>{$l}</year>
		</MedlineCitation>
	</results>