/// The [LogoProvider] class provides URLs for logos of specific companies.
/// It contains a method to retrieve the logo URL based on the company name.
class LogoProvider {
  /// Retrieves the logo URL for a given [companyName].
  ///
  /// If the [companyName] exists in the predefined map, the corresponding
  /// logo URL is returned. Otherwise, a default logo URL is returned.
  ///
  /// [companyName]: The name of the company whose logo URL is needed.
  ///
  /// Returns the URL of the company's logo as a [String].
  String getLogo(String companyName) {
    // Predefined map of company names to their logo URLs.
    Map<String, String> logo = {
      "Gizmodo.com":
          "https://guestpost.com/blog/wp-content/uploads/2019/01/Gizmodo-Logo.jpg",
      "Business Insider":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Business_Insider_Logo.svg/1280px-Business_Insider_Logo.svg.png",
      "BBC News":
          "https://cdn.icon-icons.com/icons2/70/PNG/512/bbc_news_14062.png",
      "Yahoo Entertainment":
          "https://cdn.prod.website-files.com/62b4f04befbe455f681f5197/632503e3acd3d815315269ad_yahoo-entertainment.jpg",
      "NPR":
          "https://www.vhv.rs/dpng/d/525-5258184_npr-logo-png-transparent-png.png",
      "CNET":
          "https://www.cnet.com/a/fly/bundles/cnetcss/images/core/logo/cnet_og.png",
    };

    // Check if the company name exists in the map.
    if (logo.containsKey(companyName)) {
      // Return the corresponding logo URL.
      return logo[companyName]!;
    } else {
      // Return a default logo URL if the company name is not found.
      return "https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_500/https://nfil.net/wp-content/uploads/2023/02/becoming-independent-in-adulthood.jpg";
    }
  }
}
