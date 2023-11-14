RSpec.describe "Link without configurations" do
  let!(:link) { create(:link) }

  before { visit short_path(slug: link.slug) }

  xit "renders robots meta tag" do
    expect(find('//head/meta[name="robots"]', visible: false)[:content]).to eq("noindex, nofollow")
  end

  it "renders title meta tag" do
    expect(find('//head/meta[name="title"]', visible: false)[:content]).to eq("Smash!")
  end

  it "renders name meta tag" do
    expect(find('//head/meta[itemprop="name"]', visible: false)[:content]).to eq("Smash!")
  end

  it "renders description meta tag" do
    expect(find('//head/meta[itemprop="description"]', visible: false)[:content]).to eq("Your custom url shortener!")
  end

  it "renders open graph type meta tag" do
    expect(find('//head/meta[property="og:type"]', visible: false)[:content]).to eq("website")
  end

  it "renders open graph url meta tag" do
    expect(find('//head/meta[property="og:url"]', visible: false)[:content]).to eq("#")
  end

  it "renders open graph title meta tag" do
    expect(find('//head/meta[property="og:title"]', visible: false)[:content]).to eq("Smash!")
  end

  it "renders open graph description meta tag" do
    expect(find('//head/meta[property="og:description"]', visible: false)[:content]).to eq("Your custom url shortener!")
  end

  it "renders twitter card meta tag" do
    expect(find('//head/meta[property="twitter:card"]', visible: false)[:content]).to eq("summary_large_image")
  end

  it "renders twitter url meta tag" do
    expect(find('//head/meta[property="twitter:url"]', visible: false)[:content]).to eq("#")
  end

  it "renders twitter title meta tag" do
    expect(find('//head/meta[property="twitter:title"]', visible: false)[:content]).to eq("Smash!")
  end

  it "renders twitter description meta tag" do
    expect(find('//head/meta[property="twitter:description"]', visible: false)[:content]).to eq("Your custom url shortener!")
  end

  it "renders refresh meta tag" do
    expect(find('//head/meta[http-equiv="refresh"]', visible: false)[:content]).to eq("1; url=#{link.url}")
  end

  xit "should render image meta tags" do
    expect(find('//head/meta[itemprop="image"]', visible: false)[:content]).to eq(config.image.url)
    expect(find('//head/meta[property="og:image"]', visible: false)[:content]).to eq(config.image.url)
    expect(find('//head/meta[property="twitter:image"]', visible: false)[:content]).to eq(config.image.url)
  end
end
