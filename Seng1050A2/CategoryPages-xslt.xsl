<!--CategoryPages.xsl
	SENG1050 Assignment 2
	Due: 1/11/20
	Student: Harlan De Jong
	Student No: 3349828 
	File Created: 20/10/20
-->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" />
	<xsl:template match="holidays">
		<html>
			<head>
				<title>CategoryPages-xslt.xsl</title>
				<meta charset="UTF-8" />
				<link rel="stylesheet" href="style.css"/> <!--Included style because I lost marks last time for nbot having it-->
			</head>
			<body>
				<div class="menuBar"> <!--This indicates the bar displaying the relative links to the XML pages at the top of the page-->
					<a class="link" href="index.html">Home Page</a>
					<xsl:text> </xsl:text>
					<a class="link" href="BeachHoliday.xml">Beach Holidays</a><!--Relatively linked XML pages (BeachHoliday.xml, LuxuryHoliday.xml)-->
					<xsl:text> </xsl:text>
					<a class="link" href="LuxuryHoliday.xml">Luxury Holidays</a>
					<xsl:text> </xsl:text>
					<a class="link" href="DataCollection.html">Data Collection Page</a><!--Links to all other pages using relative URL-->
					<xsl:text> </xsl:text>
					<a class="link" href="PrivacyPolicy.html">Privacy Policy</a>
					<xsl:text> </xsl:text>
					<a class="link" href="TermsConditions.html">Terms and Conditions</a>
					<xsl:text> </xsl:text>
					<a class="link" href="AboutUs.html">About Us</a>
					<xsl:text> </xsl:text>
					<a class="link" href="Contact.html">Contact Us</a>
				</div>
				<h1><span><xsl:value-of select="holidayType"/></span></h1><!--Heading 1 telling users what the page is about-->
				<hr/>
				<xsl:apply-templates select="holiday">
					<xsl:sort select="packageName"/> <!--Sorting the holidays by package name alphabetically-->
				</xsl:apply-templates>

			</body>
		</html>
	</xsl:template>

	<xsl:template match="holiday">
		<h2>
			<span><xsl:value-of select="packageName"/></span> <!--h2 is the package name of the holiday-->
		</h2>
		<ul>
			<xsl:for-each select=".">
				<li><span class="spanclass">
					<img width="40%" src="{promoPicFile/@src}"/> <!--retrieving attribute from src and displaying image-->
					<xsl:apply-templates select="attributes"/> <!--applying attributes template-->
					<xsl:apply-templates select="accomOptions"/><!--applying accomOptions template-->
					<xsl:text>Coupon Code: </xsl:text>
					<xsl:value-of select="couponCode"/><br/>
					<xsl:text>Reviews: </xsl:text>
					<xsl:value-of select="reviews"/><br/>
					<xsl:text>Related Holiday Package: </xsl:text>
					<a><xsl:attribute name="href"> <!--providing the url for the link -->
						<xsl:value-of select="externalPageURL"/>
						</xsl:attribute>
						<xsl:value-of select="externalPageURL"/>
					</a>
					</span>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="attributes"> <!--retrieves all attributes using their xpaths and outputs-->
		<xsl:text>Description: </xsl:text>
		<xsl:value-of select="description"/><br/>
		<xsl:text>Cost: </xsl:text>
		<xsl:value-of select="cost"/><br/>
		<xsl:text>Number of Nights: </xsl:text>
		<xsl:value-of select="numNights"/><br/>
		<xsl:text>Popularity: </xsl:text>
		<xsl:value-of select="popularity"/><br/>
	</xsl:template>

	<xsl:template match="accomOptions"><!--retrieves all accomOptions using their xpaths and outputs-->
		<xsl:text>Room Number: </xsl:text>
		<xsl:value-of select="roomNumber"/><br/>
		<xsl:text>Location: </xsl:text>
		<xsl:value-of select="location"/><br/>
		<xsl:text>Additional Cost: </xsl:text>
		<xsl:value-of select="additionalCost"/><br/>
		<xsl:text>Number of Bedrooms: </xsl:text>
		<xsl:value-of select="bedroomNumber"/><br/>
		<xsl:text>Number of Bathrooms: </xsl:text>
		<xsl:value-of select="bathroomNumber"/><br/>
	</xsl:template>

</xsl:stylesheet> 
