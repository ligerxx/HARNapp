//
//  ArtworkInformation.m
//  HARN
//
//  Created by Casey Feldman on 4/11/13.
//
//

#import "ArtworkInformation.h"

@implementation ArtworkInformation

@synthesize imageThumbnails, largeImages, titles, extendedDescription, smallDescription, chosenCollection;

-(void) generateInfo:(NSString *) collectionPicked
{
   if(collectionPicked != nil)
   {
       chosenCollection = collectionPicked;
   }else{
       return;
   }
   
    if([chosenCollection isEqualToString:@"African"])
    {

    }else if([chosenCollection isEqualToString:@"Asian"] )
    {
        [self setImageThumbnails:@[[UIImage imageNamed:@"Seated Bodhisattva-tb.jpg"],
                                   [UIImage imageNamed:@"Vajravarahi.jpg"],
                                   [UIImage imageNamed:@"Dancing Ganesh-tb.jpg"],
                                   [UIImage imageNamed:@"Uma-Mahesvara-tb.jpg"],
                                   [UIImage imageNamed:@"Beauties-in-the-Garden-tb.jpg"],
                                   [UIImage imageNamed:@"Blue-Glazed-Cong-Shaped-Vase-tb.jpg"],
                                   [UIImage imageNamed:@"Fuchu-Female-Tea-Pickers-tb.jpg"],
                                   [UIImage imageNamed:@"Large-Vase-with-Lotus-Design-tb.jpg"],
                                   [UIImage imageNamed:@"Lion-form-Water-Dropper-tb.jpg"],
                                   [UIImage imageNamed:@"Moonflask-with-Birds-and-Flowers-tb.jpg"],
                                   [UIImage imageNamed:@"Santal-Boy-with-Drum-tb.jpg"],
                                   [UIImage imageNamed:@"Tray-with-Birds-and-Cherry-Blossoms-tb.jpg"]
         ]];
        [self setLargeImages:@[[UIImage imageNamed:@"Seated Bodhisattva.jpg"],
                                [UIImage imageNamed:@"Vajravarahi.jpg"],
                                [UIImage imageNamed:@"Dancing Ganesh.jpg"],
                                [UIImage imageNamed:@"Uma-Mahesvara.jpg"],
                                [UIImage imageNamed:@"Beauties-in-the-Garden.jpg"],
                                [UIImage imageNamed:@"Blue-Glazed-Cong-Shaped-Vase.jpg"],
                                [UIImage imageNamed:@"Fuchu-Female-Tea-Pickers.jpg"],
                                [UIImage imageNamed:@"Large-Vase-with-Lotus-Design.jpg"],
                                [UIImage imageNamed:@"Lion-form-Water-Dropper.jpg"],
                                [UIImage imageNamed:@"Moonflask-with-Birds-and-Flowers.jpg"],
                                [UIImage imageNamed:@"Santal-Boy-with-Drum.jpg"],
                                [UIImage imageNamed:@"Tray-with-Birds-and-Cherry-Blossoms.jpg"]]];
        [self setTitles:@[@"Seated Bodhisattva",
                            @"Vajravarahi",
                            @"Dancing Ganesh",
                            @"Uma-Mahesvara",
                            @"Beauties in the Garden",
                            @"Blue Glazed Cong Shaped Vase",
                            @"Fuchu: Female Tea Pickers",
                            @"Large Vase with Lotus Design",
                            @"Lion-form Water Dropper",
                            @"Moonflask with Birds and Flowers",
                            @"Santal Boy with Drum",
                            @"Tray with Birds and Cherry Blossoms"
         ]];
        [self setSmallDescription:@[@"Korea, Joseon Dynasty (1392-1910), 17th century",
                                    @"Tibet, 13th Century",
                                    @"India, 13th Century",
                                    @"India, Northern India, 10th Century",
                                    @"Chinese, Qing Dynasty (1644-1911), early 19th century",
                                    @"Chinese, late 19th century, Guangxu reign mark (1875- 1908), Qing dynasty (1644- 1911)",
                                    @"Japanese, Edo Period (1615 - 1867), 1843 - 1847",
                                    @"Japanese, Meiji Period (1868-1912), late 19th Century",
                                    @"Korea, Joseon Dynasty (1392-1910), 19th Century",
                                    @"Japanese, Meiji period (1868-1912)",
                                    @"India, c. 1935",
                                    @"Japanese, Meiji Period, c. 1900-1910"
         ]];
        [self setExtendedDescription:@[@"\nDimensions: 25 1/2 x 17 1/4 x 13 1/2 in. (64.8 x 43.8 x 34.3 cm) Sutra Pages: 11 5/8 x 7 3/8 in. (29.5 x 18.7 cm) Sutra Pages: 16 3/4 x 12 1/8 in. (42.5 x 30.8 cm)\n\nMedium: wood with gilt, plus original sutra pages found within body cavity of sculpture\n\nCredit Line: Museum Purchase, Gift of Michael and Donna Singer\n\nMade/manufactured: Asia, Korea\n\nDescription: Gilt wood seated Bodhisattva accompanied by original sutra pages printed in red and black inks of the Lotus Sutra. Red ink sutra is written in Siddham language",
                                        @"\nDimensions: 13 1/8 x 7 1/4 x 2 1/2 in. (33.3 x 18.4 x 6.4 cm)\n\nMedium: Bronze with gemstones and polychrome\n\nCredit Line: Museum purchase, gift of Michael and Donna Singer\n\nMade/manufactured: Tibet\n\nDescription: Dancing female figure holding a skull-capped staff",
                                        @"\nDimensions: by sight: 33 7/8 x 14 1/2 x 11 1/4 in. (86 x 36.8 x 28.6 cm)\n\nMedium: Black stone\nCredit Line: Museum purchase, gift of Michael A. Singer with additional funds provided by the Kathleen M. Axline Acquisition Endowment\nMade/manufactured: India\n\nDescription: Carved in the round",
                                        @"\nDimensions: 32 3/4 x 20 1/2 x 5 7/8 in. (83.2 x 52.1 x 14.9 cm)\n\nMedium: Cream sandstone\nCredit Line: Museum Collection, University Gallery purchase\nMade/manufactured: Asia, India",
                                        @"\nArtist: Gu Luo\nChinese, 1762 - c. 1837\n\nDimensions: each leaf: 9 3/4 x 14 in. (24.8 x 35.6 cm) each image: 7 5/16 x 9 1/4 in. (18.6 x 23.5 cm)\n\nMedium: Ink and color on paper\nCredit Line: Museum purchase, funds provided by the Kathleen M. Axline Acquisition Endowment\nMade/manufactured: Asia, China\n\nDescription: Album of eight leaves depicting beautiful women engaged in various pursuits in a garden.",
                                        @"\nDimensions: 11 5/8 x 6 1/2 x 5 1/4 in. (29.5 x 16.5 x 13.3 cm)\n\nMedium: Porcelain\nCredit Line: Museum purchase, funds provided by friends of the Harn Museum of Art\nMade/manufactured: China\n\nDescription: Blue rectangular body having circular foot and mouth rings with applied elephant heads with rings.",
                                        @"\nArtist: Utagawa Hiroshige, Japanese, 1797-1858\n\nDimensions: each: 14 3/8 x 9 3/4 in. (36.5 x 24.8 cm)\nMedium: Color woodcuts\nCredit Line: Museum purchase, gift of friends of the Harn Museum\nMade/manufactured: Asia, Japan\n\nDescription: An album of 56 prints in ink and color on paper.",
                                        @"\nDimensions: 23 1/4 x 19 1/2 x 19 1/2 in. (59.1 x 49.5 x 49.5 cm) Base: 9 1/2 x 9 1/2 in. (24.1 x 24.1 cm)\nMedium: Cloisonné enamels on copper\n   Credit Line: Museum purchase, gift of private donors\nMade/manufactured: Asia, Japan\n\nDescription: Large globular vase with lotuses on a blue background.",
                                        @"\nDimensions: 1 5/16 x 2 7/8 x 2 1/8 in. (3.3 x 7.3 x 5.4 cm)\nMedium: Glazed stoneware\nCredit Line: Gift of Roy Hunt\nMade/manufactured: Asia, Korea",
                                        @"\nArtist: Miyabe Atsuyoshi\nJapanese, active late 19th - early 20th century\n\nDimensions: 11 11/16 x 9 1/4 x 3 1/2 in. (29.7 x 23.5 x 8.9 cm)\nMedium: Bronze, silver, gold, and copper\nCredit Line: Museum purchase, gift of Dr. and Mrs. David A. Cofrin\nMade/manufactured: Asia, Japan",
                                        @"\nArtist: Jamini Roy\nIndian, 1887 - 1972\n\nDimensions: Image: 30 1/4 x 14 1/4 in. (76.8 x 36.2 cm) Framed: 34 3/4 x 18 3/4 in. (88.3 x 47.6 cm)\nMedium: Opaque watercolor on canvas, mounted on masonite\nCredit Line: Gift of Mr. and Mrs. Thomas J. Needham\nMade/manufactured: Asia, India",
                                        @"\nArtist: Namikawa Sosuke\nJapanese, 1847 - 1910\n\nDimensions: 10 3/4 x 10 3/4 x 3/4 in. (27.3 x 27.3 x 1.9 cm)\n\nMedium: Cloisonné enamels\nCredit Line: Gift of Gladys Gracy Cofrin\nMade/manufactured: Japan\n\nDescription: Meiji period (19th century) inlaid mark Sakigake [Namikawa Sosuke (1847-1910) Atelier, Tokyo]. Modeled in the outline of a plum blossom and designed in silver and gold wire-outlined cloissonne and wireless emanel with two birds perched on a branch of flowering pink plum, the lower portion of the background shaded grey and the sky area shaded blue, the underside decorated with chocolate-brown cherry florets outlined in gold wire on a dark brown ground, rim shakudo."
         ]];
        
    }else if([chosenCollection isEqualToString:@"Contemporary"])
    {
        [self setImageThumbnails:@[[UIImage imageNamed:@"Dogon-Couple-tb.jpg"],
         [UIImage imageNamed:@"warhol-tb.jpg"],
         [UIImage imageNamed:@"old-mans-cloth-tb.jpg"],
         [UIImage imageNamed:@"promenade-tb.jpg"],
         [UIImage imageNamed:@"Well-4-tb.jpg"],
         [UIImage imageNamed:@"tokyo-tb.jpg"],
         [UIImage imageNamed:@"IMAGinING-Tobia-tb.jpg"],
         [UIImage imageNamed:@"Ode-a-lOubli-tb.jpg"],
         [UIImage imageNamed:@"Vessel-Series-I-no-1-tb.jpg"],
         [UIImage imageNamed:@"Nets-Infinitity-TWOS-tb.jpg"],
         [UIImage imageNamed:@"Biblioteca-Nazionale-Marciana-Venezia-III-tb.jpg"]
         ]];
        [self setLargeImages:@[[UIImage imageNamed:@"Dogon-Couple.jpg"],
         [UIImage imageNamed:@"warhol.jpg"],
         [UIImage imageNamed:@"old-mans-cloth.jpg"],
         [UIImage imageNamed:@"promenade.jpg"],
         [UIImage imageNamed:@"Well-4.jpg"],
         [UIImage imageNamed:@"tokyo.jpg"],
         [UIImage imageNamed:@"IMAGinING-Tobia.jpg"],
         [UIImage imageNamed:@"Ode-a-lOubli.jpg"],
         [UIImage imageNamed:@"Vessel-Series-I-no-1.jpg"],
         [UIImage imageNamed:@"Nets-Infinitity-TWOS.jpg"],
         [UIImage imageNamed:@"Biblioteca-Nazionale-Marciana-Venezia-III.jpg"]
         ]];
        [self setTitles:@[@"Dogon Couple",
         @"Soup Can, Vegetarian Vegetable",
         @"Old Man's Cloth",
         @"Promenade II",
         @"Well 4",
         @"Tokyo Street with Pachinko Parlor II",
         @"IMAGinING Tobia",
         @"Ode à l'Oubli",
         @"Vessel Series I, no. 1",
         @"Nets-Infinity (TWO)",
         @"Biblioteca Nazionale Marciana Venezia III"
         ]];
        [self setSmallDescription:@[@"Kehinde Wiley, American, 2008",
         @"Andy Warhol, American, 1964",
         @"El Anatsui, Ghanaian, 2003",
         @"William Kentridge, South African, 2002",
         @"Chul-Hyun Ahn, 2007",
         @"Yvonne Jacquette, American, 1985",
         @"Salem Makuria, 2006",
         @"Louise Bourgeois, American, born French, 2004",
         @"Magdalene Anyango N. Odundo, British, born Kenya, 2004",
         @"Yayoi Kusama, Japanese, 2004",
         @"Candida Höfer, German, 2003"
         ]];
        [self setExtendedDescription:@[@"\nArtist: Kehinde Wiley\nAmerican, born 1977\n\nDimensions: 8 x 7 ft. (243.8 x 213.4 cm)\nMedium: Oil on canvas\nCredit Line: Museum purchase, funds provided by the David A. Cofrin Acquisition Endowment and Caroline Julier and James G. Richardson Acquisition Fund\nMade/manufactured: United States\n\nDescription: Two young Senegalese men sit holding special poses that emulate figures of Dogon sculpture. The background has a vivid pattern of vines and flowers in orange, red and white.",
         @"\nArtist: Andy Warhol\nAmerican, 1928 - 1987\n\nDimensions: frame: 41 5/8 x 29 1/4 in. (105.7 x 74.3 cm) mat: 34 1/4 x 22 1/4 in. (87 x 56.5 cm) Print mark: 32 x 18 3/4 in. (81.3 x 47.6 cm)\nMedium: Silkscreen\nCredit Line: Gift of Richard Anuszkiewicz",
         @"\nArtist: El Anatsui\nGhanaian, born 1944\n\nDimensions: 16 ft. x 17 ft. 1 in. (487.7 x 520.7 cm)\nMedium: Aluminum and copper wire\nCredit Line: Museum purchase with funds from friends of the Harn Museum\n\nDescription: Disks and strips made of bottle tops connected with thin copper wire; predominately gold and red.",
         @"\nArtist: William Kentridge\nSouth African, b. 1955\n\nDimensions: maximum : 15 9/16 x 16 1/8 x 16 1/4 in. (39.5 x 41 x 41.3 cm)\nMedium: Four bronze sculptures with dark patina\nCredit Line: Museum purchase by exchange, gift of Louise H. Courtelis with additional funds provided by the Caroline Julier and James G. Richardson Acquisition Endowment and an anonymous donor.\n\nDescription: four bronze sculptures with dark brown patina.",
         @"\nArtist: Chul-Hyun Ahn\nborn 1971\n\nDimensions: 20 x 39 x 39 in. (50.8 x 99.1 x 99.1 cm)\nMedium: Concrete, mirrors, light\nCredit Line: Museum purchase, funds provided by the David A. Cofrin Acquisition Endowment and friends of the Harn Museum of Art\n\nDescription: A florescent light is placed in a square concrete enclosure topped by a one-way mirror. The work creates and effect of light stretching out into infinity.",
         @"\nArtist: Yvonne Jacquette\nAmerican, born 1934\n\nDimensions: 7 ft. 2 1/2 in. x 55 1/4 in. (219.7 x 140.3 cm) frame: 7 ft. 3 5/8 in. x 56 1/2 in. (222.6 x 143.5 cm)\nMedium: Oil on canvas\nCredit Line: Museum purchase, gift of Mary Ann P. Cofrin\n\nDescription: Cityscape.",
         @"\nArtist: Salem Mekuria\nborn 1947\n\nMedium: Triptych video installation\nCredit Line: Museum purchase, Phillips Art Acquisition Funds\n\nDescription: This work provides a documentary tribute to Ethiopia with an extensive record of people and the landscape. The video is projected on three screens with images that synchronize across them.",
         @"\nArtist: Louise Bourgeois\nAmerican, born France, 1911 - 2010\n\nDimensions: bound: 10 3/4 x 13 1/4 in. (27.3 x 33.7 cm) 36 pages, each: 10 3/4 x 13 1/4 in. (27.3 x 33.7 cm)\nMedium: Book, hand-sewn and stitched cloth with lithography\nCredit Line: Museum Purchase, funds provided by the David A. Cofrin Art Acquisition Endowment\n\nDescription: The book contains 36 pages including cover and back page. Each page is framed separately except for the cover with its frames as a whole. The pages are printed or sewn with abstract designs or text in primarily subtle reds and blues. The edition includes 25 copies, with 7 AP copies. The work has been produced by Solo Impressions, New York under the supervision of Louise Bourgeois. The book was published as Peter Blum Edition, New York.",
         @"\nArtist: Magdalene Anyango N. Odundo\nBritish, born Kenya, 1950\n\nDimensions: 17 3/4 x 13 in. (45.1 x 33 cm)\nMedium: Red clay, fired once\nCredit Line: Museum purchase, funds provided by friends of the Harn Museum\nMade/manufactured: England, Farnham\n\nDescription: Symmetrical vessel with globular belly, narrow neck, wide flared rim, small foot, orange-red, burnished surface with even coloration.",
         @"\nArtist: Yayoi Kusama\nJapanese, born 1929\n\nDimensions: 28 5/8 x 35 13/16 in. (72.7 x 91 cm)\nMedium: Acrylic on canvas\nCredit Line: Museum purchase, funds provided by the David A. Cofrin Art Acquisition Endowment and friends of the Harn Museum.\n\nDescription: Abstract painting with overall red paint on white in a repetitive pattern that resembles a net.",
         @"\nArtist: Candida Höfer\nGerman, born 1944\n\nDimensions: 59 7/8 x 59 7/8 in. (152.1 x 152.1 cm)\nMedium: Chromogenic development print\nCredit Line: Museum purchase, funds provided by the Caroline Julier and James G. Richardson Art Acquisition Fund with additional funds provided by the David A. Cofrin Art Acquisition Endowment\n\nSubject: Europe, Venice\nDescription: Color photograph of the National Library of Venice taken with a wide-angle lens accentuating the perspective of the room, causing the floor to rise illusionistically. The room contains library tables on both sides, a painted ceiling and a pedimented door at the end of the room."
         ]];
    }else if([chosenCollection isEqualToString:@"Modern"])
    {
        [self setImageThumbnails:@[[UIImage imageNamed:@"Ireland Reef-tb.jpg"],
         [UIImage imageNamed:@"Three Men at Union Square-tb.jpg"],
         [UIImage imageNamed:@"Faunesse-tb.jpg"],
         [UIImage imageNamed:@"El-Encuentro-tb.jpg"],
         [UIImage imageNamed:@"champ-tb.jpg"],
         [UIImage imageNamed:@"reclining-tb.jpg"],
         [UIImage imageNamed:@"Manhattan-tb.jpg"],
         [UIImage imageNamed:@"The-Art-of-the-Negro-Native-Forms-tb.jpg"],
         [UIImage imageNamed:@"The-Woodcutter-tb.jpg"],
         [UIImage imageNamed:@"Cubist-Still-Life-tb.jpg"],
         ]];
        [self setLargeImages:@[[UIImage imageNamed:@"Ireland Reef.jpg"],
         [UIImage imageNamed:@"Three Men at Union Square.jpg"],
         [UIImage imageNamed:@"Faunesse.jpg"],
         [UIImage imageNamed:@"El-Encuentro.jpg"],
         [UIImage imageNamed:@"champ.jpg"],
         [UIImage imageNamed:@"reclining.jpg"],
         [UIImage imageNamed:@"Manhattan.jpg"],
         [UIImage imageNamed:@"The-Art-of-the-Negro-Native-Forms.jpg"],
         [UIImage imageNamed:@"The-Woodcutter.jpg"],
         [UIImage imageNamed:@"Cubist-Still-Life.jpg"],
         ]];
        [self setTitles:@[@"Ireland Reef",
         @"Three Men at Union Square",
         @"Faunesse debout (Standing Fauness)",
         @"El Encuentro (The Encounter)",
         @"Champ d'avoine (Oat Field)",
         @"Reclining",
         @"Manhattan",
         @"The Art of the Negro: Native Forms (study)",
         @"The Woodcutter",
         @"Cubist Still Life"
         ]];
        [self setSmallDescription:@[@"Rockwell Kent, American, 1926",
         @"Isabel Bishop, American, 1930",
         @"Auguste Rodin, French, 1884",
         @"Angel Botello, Puerto Rican, born Spainish, 1950",
         @"Claude Monet, French, 1890",
         @"Alexander Archipenko, American, born Ukraine, 1922",
         @"George Grosz, German, 1946",
         @"Hale Aspacio Woodruff, American, 1945",
         @"Robert Gwathmey, American, 1945",
         @"Suzy Frelinghuysen, American, 1943"
         ]];
        [self setExtendedDescription:@[@"\nArtist: Rockwell Kent\nAmerican, 1882 - 1971\n\nDimensions: 24 x 30 in. (61 x 76.2 cm)\nMedium: Oil on panel\nCredit Line: Gift from the Stephen and Carol Shey Collection\n\nDescription: A dramatic landscape of a remote and unihabited reef set against an expansive sky of blues and pinks, rendered with precise forms and strong contrasts of light and dark.",
         @"\nArtist: Isabel Bishop\nAmerican, 1902 - 1988\n\nDimensions: Other: 24 1/4 x 20 in. (61.6 x 50.8 cm) 31 x 27 1/4 in. (78.7 x 69.2 cm)\nMedium: Oil on canvas, mounted over Masonite\nCredit Line: Museum purchase, funds provided by an anonymous donor and the James G. and Caroline Julier Richardson Fund\n\nSubject: North and Central America\nDescription: Three males and one female in a cityscape.",
         @"\nArtist: Auguste Rodin\nFrench, 1840 - 1917\n\nDimensions: 23 x 10 1/2 x 9 in. (58.4 x 26.7 x 22.9 cm)\nMedium: Bronze\nCredit Line: Bequest of Ruth P. Phillips\n\nDescription: Model made in 1884, cast probably early 20th century. Standing nude female figure cast from the artist's Gates of Hell project, inspired by Dante's Divine Comedy.",
         @"\nArtist: Angel Botello\nPuerto Rican, born Spain, 1913 - 1986\n\nDimensions: 31 5/8 x 35 3/4 in. (80.3 x 90.8 cm)\nMedium: Oil on burlap\nCredit Line: Museum purchase, funds provided by friends of the Harn Museum of Art\n\nDescription: Abstract composition with figures: signed lower right.",
         @"\nArtist: Claude Monet\nFrench, 1840 - 1926\n\nDimensions: 26 x 36 7/16 in. (66 x 92.6 cm) frame: 36 x 48 x 4 1/2 in. (91.4 x 121.9 x 11.4 cm)\nMedium: Oil on canvas\nCredit Line: Gift of Michael A. Singer\nMade/manufactured: Europe, Giverny\n\nSubject: Europe, Giverny",
         @"\nArtist: Alexander Archipenko\nAmerican, born Ukraine, 1887 - 1964\n\nDimensions: 17 1/2 x 11 x 11 1/4 in. (44.5 x 27.9 x 28.6 cm)\nMedium: Bronze\nCredit Line: Bequest of Ruth P. Phillips\n\nDescription: Reclining figure of a female nude.",
         @"\nArtist: George Grosz\nGerman, 1893 - 1959\n\nDimensions: 24 x 20 in. (61 x 50.8 cm)\nMedium: Oil on board\nCredit Line: Gift of William H. and Eloise R. Chandler\n\nSubject: North and Central America, New York",
         @"\nArtist: Hale Aspacio Woodruff\nAmerican, 1900 - 1980\n\nDimensions: framed: 28 3/4 x 26 3/4 x 1 1/4 in. (73 x 67.9 x 3.2 cm) Visible canvas: 22 3/4 x 20 7/8 in. (57.8 x 53 cm)\nMedium: Oil on canvas\nCredit Line: Museum purchase, gift of an anonymous donor with additional funds provided by exchange, gift of Helen Sawyer Farnsworth\n\nDescription: This is a study for one of six canvases in the mural series entitled 'Art of the Negro', commissioned for the Trevor Arnett Library (in-situ) at Atlanta University (now Clark-Atlanta University), completed in 1952.",
         @"\nArtist: Robert Gwathmey\nAmerican, 1903 - 1988\n\nDimensions: image: 22 x 15 in. (55.9 x 38.1 cm) Other (frame): 30 5/8 x 23 1/2 in. (77.8 x 59.7 cm)\nMedium: Oil on canvas\nCredit Line: Museum purchase, funds provided by the Caroline Julier and James G. Richardson Art Acquisition Fund",
         @"\nArtist: Suzy Frelinghuysen\nAmerican, 1911 - 1988\n\nDimensions: 9 x 13 in. (22.9 x 33 cm)\nMedium: Oil and Collage on board\nCredit Line: Museum purchase, funds provided by the Caroline Julier and James G. Richardson Acquisition Fund, with additional fund provided by exchange, gift of Helen Sawyer Farnsworth\n\nDescription: An abstract still life composition of objects rendered in black, white and purple paint as well as corrugated cardboard, set against a blue background.",
         ]];
    }else if([chosenCollection isEqualToString:@"Ancient American"])
    {
        [self setImageThumbnails:@[[UIImage imageNamed:@"stirrup-tb.jpg"],
         [UIImage imageNamed:@"bridge-tb.jpg"],
         [UIImage imageNamed:@"Burial-Urn-tb.jpg"],
         [UIImage imageNamed:@"Jaguar-effigy-metate-tb.jpg"],
         [UIImage imageNamed:@"Cylindrical-vase-with-heads-of-Lord-of-Underworld-tb.jpg"],
         [UIImage imageNamed:@"Tripod-Plate-with-Rain-Serpent-tb.jpg"],
         [UIImage imageNamed:@"Head-of-Ruler-tb.jpg"],
         [UIImage imageNamed:@"Standing-figure-in-the-Laughing-Child-form-tb.jpg"],
         [UIImage imageNamed:@"Seated-Female-Figurine-tb.jpg"],
         [UIImage imageNamed:@"Seated-Companion-Urn-tb.jpg"],
         ]];
        [self setLargeImages:@[[UIImage imageNamed:@"stirrup.jpg"],
         [UIImage imageNamed:@"bridge.jpg"],
         [UIImage imageNamed:@"Burial-Urn.jpg"],
         [UIImage imageNamed:@"Jaguar-effigy-metate.jpg"],
         [UIImage imageNamed:@"Cylindrical-vase-with-heads-of-Lord-of-Underworld.jpg"],
         [UIImage imageNamed:@"Tripod-Plate-with-Rain-Serpent.jpg"],
         [UIImage imageNamed:@"Head-of-Ruler.jpg"],
         [UIImage imageNamed:@"Standing-figure-in-the-Laughing-Child-form.jpg"],
         [UIImage imageNamed:@"Seated-Female-Figurine.jpg"],
         [UIImage imageNamed:@"Seated-Companion-Urn.jpg"],
         ]];
        [self setTitles:@[@"Stirrup-Spout Bottle of Crab God with Fanged Feline Mouth",
         @"Bridge-spout bottle of Cat God wearing trophy head",
         @"Burial Urn",
         @"Jaguar effigy metate",
         @"Cylindrical vase with heads of Lord of Underworld",
         @"Tripod Plate with Rain Serpent",
         @"Head of Ruler",
         @"Standing figure in the 'Laughing Child' form",
         @"Seated Female Figurine",
         @"Seated Companion Urn"
         ]];
        [self setSmallDescription:@[@"Moche culture, 200-300, Early Intermediate Period",
         @"Nazca culture, Peru, South Coast, 100-300",
         @"Colombian, Lower Magdalena River, Moskito, 1200-1500",
         @"Costa Rican, Central Highlands, Period VI (Late Period, 100-1522)",
         @"Guatemala, northern Peten, Mayan, 700-830",
         @"Mayan, Mexico/Guatemala, 700-830",
         @"Mayan, Mexico, Yucatan, 600-950",
         @"Nahuat culture, Mexico, 550-850",
         @"Mayan, Mexico, Campeche, 550-830",
         @"Zapotec people, Valley of Oaxaca, 300-500"
         ]];
        [self setExtendedDescription:@[@"\nMaker: Moche people\n\nDimensions: 9 1/4 x 5 1/2 x 7 1/4 in. (23.5 x 14 x 18.4 cm)\nMedium: Burnished red-slipped ceramic\nCredit Line: Museum collection, University Gallery purchase\nMade/manufactured: South America\n\nDescription: From the Moche III phase. Stirrup spout vessel, flat bottom with spherical body, figure of crab-man lying on top of vessel - body of crab with claws looped around in front, human or frog legs in back, human head with bared teeth and fangs, flat-disk cap, stirrup spout running from back of head down into vessel of body",
         @"\nMaker: Nazca culture\nPeru, South Coast\n\nDimensions: 7 3/4 x 5 3/4 x 5 3/4 in. (19.7 x 14.6 x 14.6 cm)\nMedium: Burnished polychrome ceramic\nCredit Line: Museum Collection, University Gallery purchase\n\nDescription: Spherical vessel, bottom slightly widened, top slightly tapered with 2 tubular spouts rising around center of top, connected by wide flat band to make a handle. Painted in burnished polychrome of feline figure and head on one side with connecting body over top and trophy head on other side, at base of tail, wall segmented by thin white lines and black vertical bands.",
         @"\nMaker: Colombia, Lower Magdalena River, Moskito\n\nDimensions: urn: 16 5/8 x 8 7/8 x 8 7/8 in. (42.2 x 22.5 x 22.5 cm) lid: 16 5/8 x 8 3/8 x 8 3/8 in. (42.2 x 21.3 x 21.3 cm)\nMedium: Ceramic\nCredit Line: Gift of Rod McGalliard\nMade/manufactured: South America\n\nDescription: Lid surmounted by a seated figure on a stool, ovoid body, pigment.",
         @"\nMaker: Costa Rica, Central Highlands\n\nDimensions: 8 1/2 x 14 1/8 x 21 3/8 in. (21.6 x 35.9 x 54.3 cm)\nMedium: Carved volcanic stone (basalt)\nCredit Line: Gift of Dr. Cecil M. Smith and Family\nMade/manufactured: North and Central America,\n\nDescription: four legged metate with oval shaped grinding plate, at one end is a jaguar head, at the other a tail, around the rim are images of trophy heads",
         @"\nMaker: Guatemala, northern Peten, Maya\n\nDimensions: 4 3/8 x 4 1/8 x 4 1/8 in. (11.1 x 10.5 x 10.5 cm)\nMedium: Polychrome painted ceramic\nCredit Line: Gift of Lawrence J. and Eileen Cassard, M.D.\nMade/manufactured: North and Central America\n\nDescription: Cylindrical vase-shaped vessel, deep polychrome; complex figure glyphs.",
         @"\nMaker: Maya peoples, Mexico/Guatemala\n\nDimensions: 3 1/4 x 13 1/4 in. (8.3 x 33.7 cm)\nMedium: Ceramic with polychrome\nCredit Line: Gift of Lawrence J. Cassard, M.D.\nMade/manufactured: North and Central America\n\nDescription: Large tripod plate with hieroglyphic in center bordered by geometric black and red feather-type forms, left side slightly eroded, hollow legs with rattles, calcification on one edge of surface.",
         @"\nMaker: Maya peoples, Mexico, Yucatan\n\nDimensions: 10 1/2 x 7 x 4 1/4 in. (26.7 x 17.8 x 10.8 cm)\nMedium: Stucco with red pigment\nCredit Line: Gift of Lawrence J. and Eileen Cassard, M.D.\nMade/manufactured: North and Central America\n\nDescription: Stucco head with rounded features, large mouth with heavy lips; broad flat nose, eyes are puffed out with bottom half cut away, making appearance of double eye lids; heavy headdress with large thick brow band, central circular medallion with raised center and radiating grooves. (from accession worksheet) White stucco molded over coarse aggregate; traces of red paint on the face, blue on headdress band. (from UFG publication)",
         @"\nMaker: Nahuat culture, Mexico, south-central Veracruz\n\nDimensions: 16 x 10 3/16 x 2 7/8 in. (40.6 x 25.9 x 7.3 cm)\nMedium: Red painted ceramic\nCredit Line: Gift of Lawrence J. Cassard, M.D.\nMade/manufactured: North and Central America",
         @"\nMaker: Maya peoples, Mexico, Campeche\n\nDimensions: 7 x 5 1/4 x 3 3/4 in. (17.8 x 13.3 x 9.5 cm)\nMedium: Ceramic with blue and white pigment\nCredit Line: Gift of Lawrence J. Cassard, M.D.\nMade/manufactured: North and Central America\n\nDescription: Seated hand-fashioned female figure, large wedged nose extending from center of forehead to full lips, almond-shaped eyes, large earrings with white slip, pilled necklace, mantle around shoulders down to waist, small arms with hands attached to folded legs, heavy bracelets on arms; white, red, and blue traces of paint.",
         @"\nMaker: Zapotec people, Valley of Oaxaca, Mexico\n\nDimensions: 18 x 11 3/4 x 10 3/4 in. (45.7 x 29.8 x 27.3 cm)\nMedium: White-slipped ceramic with traces of cinnabar\nCredit Line: Gift of Mrs. A. H. Spivack, in memory of Dr. A. H. Spivack\n\nDescription: Seated male figure with legs crossed in front, hands on knees hollow cylindrical body with opening at top of headdress good proportions to figure, good modeling of features, wears large ornamental headdress, ear spools, necklace with large pendant and bracelets. White pigment on part of the face and body, also at spots in headdress and pendant. Monte Alban IIIA phase."
          ]];
    }else if([chosenCollection isEqualToString:@"Oceanic"])
    {
        
    }else if([chosenCollection isEqualToString:@"Photography"])
    {
        
    }else if([chosenCollection isEqualToString:@"Prints and Drawings Bef..."])
    {
        [self setImageThumbnails:@[[UIImage imageNamed:@"papauer-tb.jpg"],
         [UIImage imageNamed:@"pancratium-tb.jpg"],
         [UIImage imageNamed:@"heliconia-tb.jpg"],
         [UIImage imageNamed:@"deer-tb.JPG"],
         [UIImage imageNamed:@"dream-tb.JPG"],
         [UIImage imageNamed:@"madhouse-tb.jpg"],
         [UIImage imageNamed:@"Disparte-General-tb.JPG"],
         [UIImage imageNamed:@"Inscriptions-Sepulchrales-tb.jpg"],
         [UIImage imageNamed:@"China-Limodoron-tb.jpg"],
         [UIImage imageNamed:@"The-Deconstruction-of-the-French-Armada-tb.jpg"],
         ]];
        [self setLargeImages:@[[UIImage imageNamed:@"papauer.jpg"],
         [UIImage imageNamed:@"pancratium.jpg"],
         [UIImage imageNamed:@"heliconia.jpg"],
         [UIImage imageNamed:@"deer.JPG"],
         [UIImage imageNamed:@"dream.JPG"],
         [UIImage imageNamed:@"madhouse.jpg"],
         [UIImage imageNamed:@"Disparte-General.JPG"],
         [UIImage imageNamed:@"Inscriptions-Sepulchrales.jpg"],
         [UIImage imageNamed:@"China-Limodoron.jpg"],
         [UIImage imageNamed:@"The-Deconstruction-of-the-French-Armada.jpg"],
         ]];
        [self setTitles:@[@"Papauer Corniculatum Luteum",
         @"Pancratium I",
         @"Heliconia Acuminata",
         @"Stalking Deer",
         @"The Dream of Aeneas",
         @"Scene in a Madhouse",
         @"Disparte General",
         @"Inscriptions Sepulchrales et Autres Trouvees dans les Fabriques",
         @"China Limodoron",
         @"The Destruction of the French Armada"
         ]];
        [self setSmallDescription:@[@"Basilius Besler, German, 1613",
         @"Johann Michael Seligmann, German, 1768",
         @"Maria Sibylla Merian, German, 1705",
         @"Theodore de Bry, Flemish, 1591",
         @"Salvator Rosa, Italian, 1663-1664",
         @"William Hogarth, English, 1735-1763",
         @"Francisco de Goya, Spanish, 1875",
         @"Giovanni Battista Piranesi, Italian, 1804",
         @"Dr. Robert John Thornton, British, 1799-1812",
         @"James Gillray, English, 1797"
         ]];
        [self setExtendedDescription:@[@"\n1613\n\nBasilius Besler\nGerman, 1561-1629\n\nCopperplate engraving, hand colored\nFrom Hortus Eystettensis (Eichstätt, 1613)\nMuseum purchase, funds provided by Peter DeSorcy, with additional funds provided by Gladys Harn Harris Art Acquisition Endowment",
         @"\n1768\n\nJohann Michael Seligmann, after unknown artist\nGerman, 1702-1762\n\nCopperplate engraving, hand colored\nFrom Hortus Nitidissimis, by Christoph Jakob Trew and Georg Dionysius Ehret (Nuremberg, 1768)\nMuseum purchase, funds provided by Lawrence Reed Miller",
         @"\nc. 1705\n\nMaria Sibylla Merian\nGerman, 1647 - 1717\n\nEngraving, hand colored\nFrom Metamorphosis Insectorum Surinamensium (Amsterdam, 1705)\nMuseum purchase, funds provided by Peter DeSorcy",
         @"\n1591\n\nTheodore de Bry\nFranco Flemish, 1528–1598\n\nEngraving\nFrom Brief Narration of Europeans in Florida\nUniversity Gallery purchase",
         @"\nc. 1663-1664\n\nSalvator Rosa\nItalian, 1615-1673\n\nEtching with drypoint\nUniversity Gallery purchase",
         @"\n1735-1763\n\nWilliam Hogarth\nEnglish, 1697 - 1764\n\nEngraving\nFrom A Rake’s Progress\nGift of H.J. Roberts, M.D., and the Honorable Carol A. Roberts",
         @"\nArtist: Francisco de Goya\nSpanish, 1746 - 1828\n\nDimensions: sheet: 12 1/8 x 17 1/4 in. (30.8 x 43.8 cm) Image: 8 1/2 x 13 in. (21.6 x 33 cm)\nMedium: Etching and burnished aquatint\nCredit Line: Museum Collection, University Gallery purchase\n\nDescription: ink on paper",
         @"\nArtist: Giovanni Battista Piranesi\nItalian, 1720 - 1778\n\nDimensions: sheet: 21 x 26 1/2 in. (53.3 x 67.3 cm) image: 17 x 22 3/4 in. (43.2 x 57.8 cm)\nMedium: Engraving\nCredit Line: Museum collection, University Gallery purchase, Gift of the Department of Architecture, University of Florida\n\nDescription: inscriptions on marble stones found in Pompeia on the buildings",
         @"\nArtist: Dr. Robert John Thornton\nBritish, 1768 - 1837\n\nDimensions: 20 x 16 in. (50.8 x 40.6 cm) Other (frame): 29 3/4 x 25 in. (75.6 x 63.5 cm)\nMedium: Hand-colored engraved plate (in aquatint, mezzotint, stipple, line)\nCredit Line: Gift of Kirk Henckels",
         @"\nArtist: James Gillray\nEnglish, 1757 - 1815\n\nDimensions: sheet: 12 x 15 7/8 in. (30.5 x 40.3 cm) image: 10 3/8 x 15 in. (26.4 x 38.1 cm)\nMedium: Etching and aquatint\nCredit Line: Gift of Wilse B. and Mary H. Webb\n\nDescription: Political illustration of a storm at sea sinking the French Armada."
         ]];
    }else
    {
        NSLog(@"BIG ERROR");
        return;
    }
}

-(void) setImageThumbnails:(NSArray *)thumbnails
{
    imageThumbnails = thumbnails;
    return;
}

-(void) setLargeImages:(NSArray *)images
{
    largeImages = images;
    return;
}

-(void) setTitles:(NSArray *)newtitles
{
    titles = newtitles;
    return;
}

-(void) setSmallDescription:(NSArray *)newSmallDescription
{
    smallDescription = newSmallDescription;
    return;
}

-(void) setExtendedDescription:(NSArray *)newExtendedDescription
{
    extendedDescription = newExtendedDescription;
    return;
}

@end
