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
        
    }else if([chosenCollection isEqualToString:@"Ancient American"])
    {
        
    }else if([chosenCollection isEqualToString:@"Oceanic"])
    {
        
    }else if([chosenCollection isEqualToString:@"Photography"])
    {
        
    }else if([chosenCollection isEqualToString:@"Prints and Drawings Bef..."])
    {
        
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
