//
//  NewsArticle.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import Foundation

class NewsArticle {
    //Basic identifiable properties
    var id: UUID
    var sourceName: String?
    var author: String?
    var title: String?
    var descriptionText: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
    
    //Initializer
    init(id: UUID,
         sourceName: String? = nil,
         author: String? = nil,
         title: String? = nil,
         descriptionText: String? = nil,
         url: String? = nil,
         urlToImage: String? = nil,
         publishedAt: Date? = nil,
         content: String? = nil
    ) {
        self.id = id
        self.sourceName = sourceName
        self.author = author
        self.title = title
        self.descriptionText = descriptionText
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}

//Mock Data for Testing and Previews
extension NewsArticle: Identifiable {
    static var mockNews: NewsArticle {
        NewsArticle(
            id: UUID(),
            sourceName: "TechCrunch",
            author: "John Doe",
            title: "Rachel Maddow slams presence of tech CEOs at Trump’s inauguration: ‘How is this happening in America?’",
            descriptionText: "Apple has unveiled its latest iPhone model, featuring groundbreaking new technologies.",
            url: "https://techcrunch.com/article/apple-new-iphone",
            urlToImage: "https://techcrunch.com/images/article/iphone.png",
            publishedAt: Date(timeIntervalSinceNow: -3600), // Published 1 hour ago
            content: "Apple has just revealed its latest flagship device at their annual event..."
        )
    }
    static var mockNewsArray: [NewsArticle] {
        [
            NewsArticle(
                id: UUID(),
                sourceName: "The New Republic",
                author: "Hafiz Rashid",
                title: "Elon Musk to Get Terrifying Level of Access to Trump’s White House",
                descriptionText: "Donald Trump has been president for less than a day, and Elon Musk already has a White House email address—and is expected to receive office space as well. \r\nThe Hill reports that the world’s richest man, who will be the head of the Department of Government E…",
                url: "https://newrepublic.com/post/190468/elon-musk-access-trump-white-house-office-email",
                urlToImage: "https://images.newrepublic.com/5ab3e7f3595277b6ede3f098bc81f10f069da3b2.jpeg?w=1200&h=630&crop=faces&fit=crop&fm=jpg",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "Migrants in Ciudad Juárez who were waiting for their 1pm CBP1 parole appointments learned 20 minutes ago that the app has shut down &amp; those appointments are no longer valid, saidThe Washington Po… [+1106 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "TechCrunch",
                author: "Kirsten Korosec",
                title: "US safety regulators expand Ford hands-free driving tech investigation | TechCrunch",
                descriptionText: "A U.S. federal safety regulator has “upgraded” its investigation into Ford's hands-free advanced driver assistance system known as BlueCruise — a required",
                url: "https://techcrunch.com/2025/01/20/us-safety-regulators-expand-ford-hands-free-driving-tech-investigation/",
                urlToImage: "https://techcrunch.com/wp-content/uploads/2024/02/ford-blue-cruise.jpeg?resize=1200,900",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "A U.S. federal safety regulator has upgraded its investigation into Ford’s hands-free advanced driver assistance system known as BlueCruise a required step before a recall can be issued.\r\nThe Nationa… [+2246 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "Fox News",
                author: "David Spector",
                title: "Rachel Maddow slams presence of tech CEOs at Trump’s inauguration: ‘How is this happening in America?’",
                descriptionText: "MSNBC host Rachel Maddow blasted President Trump's inauguration over the fact that multiple CEOs from Big Tech companies were in attendance at the ceremony.",
                url: "https://www.foxnews.com/media/rachel-maddow-slams-presence-tech-ceos-trumps-inauguration-how-happening-america",
                urlToImage: "https://static.foxnews.com/foxnews.com/content/uploads/2025/01/donald-trump-presidential-inauguration-day-washington-dc_163.jpg",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "Rachel Maddow could not contain her dismay at the presence of wealthy entrepreneurs seated prominently at President Trumps inauguration, asking, \"how is this happening in America?\"\r\nTrumps inaugurati… [+2206 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "Digital Journal",
                author: "Dr. Tim Sandle",
                title: "Boost to used electric car sales in the UK: Are the days of petrol vehicles numbered?",
                descriptionText: "Electric are sales are on the rise in the UK. What is the future for petrol cars?\nThe post Boost to used electric car sales in the UK: Are the days of petrol vehicles numbered? appeared first on Digital Journal.",
                url: "https://www.digitaljournal.com/world/boost-to-used-electric-car-sales-in-the-uk-are-the-days-of-petrol-vehicles-numbered/article",
                urlToImage: "https://www.digitaljournal.com/wp-content/uploads/2024/12/2716ee02a427c89d2c8043b1b897bf6311b8baeb.jpg",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "The launch of new electric models like the ID Buzz failed to help VW overcome a downturn in sales of EVs in Europe - Copyright AFP/File JADE GAO\r\nThe automotive company cinch, a seller of used electr… [+2491 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "Snopes.com",
                author: "Aleksandra Wrona",
                title: "Nikola Tesla Wished He Could Bring His Mother a Glass of Water in Last Words?",
                descriptionText: "\"All these years I have spent in the service of mankind brought me nothing but insults and humiliation,\" Tesla allegedly wrote.",
                url: "https://www.snopes.com//news/2025/01/20/tesla-last-words/",
                urlToImage: "https://mediaproxy.snopes.com/width/1200/https://media.snopes.com/2025/01/tesla_quote.png",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "For years, the alleged last words of Serbian-American inventor Nikola Tesla have circulated online, purporting to reveal his final thoughts before his death in January 1943. The quote attributed to T… [+5869 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "Electrek",
                author: "Peter Johnson",
                title: "Hyundai launches new Creta Electric SUV in India, starting at just $20,000: Meet the new EV",
                descriptionText: "Hyundai officially launched its newest electric vehicle, the Creta Electric, in India. It starts at just over $20,000 and has a range of nearly 300 miles. The Creta EV is Hyundai’s first electric SUV made in the country. Here’s a look at the new model.\n\n\n\n mo…",
                url: "http://electrek.co/2025/01/20/hyundai-launches-new-creta-ev-india-starting-20000/",
                urlToImage: "https://i0.wp.com/electrek.co/wp-content/uploads/sites/3/2025/01/Hyundai-Creta-EV-20000.jpeg?resize=1200%2C628&quality=82&strip=all&ssl=1",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "Hyundai officially launched its newest electric vehicle, the Creta Electric, in India. It starts at just over $20,000 and has a range of nearly 300 miles. The Creta EV is Hyundai’s first electric SUV… [+2348 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "seattlepi.com",
                author: "By THOMAS BEAUMONT, Associated Press",
                title: "Elon Musk's prominence during inauguration ceremonies stamps tech titan's place in Trump's orbit",
                descriptionText: "The blossoming relationship between President Donald Trump and tech titan Elon Musk was on full display throughout Monday's inauguration ceremonies. Musk sat near Trump during the ceremony in the Capitol Rotunda, and pumped his fists when the president promot…",
                url: "https://www.seattlepi.com/news/politics/article/elon-musk-s-prominence-during-inauguration-20045620.php",
                urlToImage: "https://s.hdnux.com/photos/01/46/57/05/26931527/3/rawImage.jpg",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "Jeff Bezos, from second left, Donald Trump Jr., Sundar Pichai, Elon Musk, Usha Vance, Doug Burgum and Vice President JD Vance applaud during the 60th Presidential Inauguration in the Rotunda of the U… [+4789 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "ABC News",
                author: "THOMAS BEAUMONT Associated Press",
                title: "Elon Musk's prominence during inauguration ceremonies stamps tech titan’s place in Trump's orbit",
                descriptionText: "The blossoming relationship between President Donald Trump and tech titan Elon Musk was on full display throughout Monday's inauguration ceremonies",
                url: "https://abcnews.go.com/US/wireStory/elon-musks-prominence-inauguration-ceremonies-stamps-tech-titans-117909578",
                urlToImage: "https://i.abcnewsfe.com/a/e9e9f8fa-e3c6-456b-8b5e-fad1f55af35f/wirestory_70ad9d5f854fce40f44cdabbd8084734_16x9.jpg?w=1600",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "Getting humans to Mars has long been an obsession for SpaceX CEO Elon Musk. On Monday, that project got a full endorsement from the newly sworn-in president.\r\nDuring his inaugural address, President … [+3620 chars]"
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "HuffPost",
                author: "Brandi Buchman",
                title: "Elon Musk’s ‘Odd-Looking’ Salute Stuns CNN Anchors",
                descriptionText: "A hand gesture from the billionaire Trump ally drew questions.",
                url: "https://www.huffpost.com/entry/elon-musk-odd-looking-salute-stuns-cnn-anchors_n_678eb830e4b00ac648b79b95",
                urlToImage: "https://img.huffingtonpost.com/asset/678eba5416000023003d382b.jpeg?cache=tK8mmPwk0r&ops=1200_630",
                publishedAt: Date(timeIntervalSinceNow: -3600),
                content: "Elon Musks use of an arm gesture that distinctly resembled a Roman salute, a greeting arguably best known for its use among members of the Nazi Party, generated confusion and concern as the billionai… [+2771 chars]"
            )
        ]
    }
}
