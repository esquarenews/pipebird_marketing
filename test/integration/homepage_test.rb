require "test_helper"

class HomepageTest < ActionDispatch::IntegrationTest
  test "homepage renders marketing content and placeholder logos" do
    get root_path

    assert_response :success
    assert_select "h1", /Pipebird keeps your platforms and app synced\./
    assert_select ".logo-strip span", minimum: 6
    assert_select "a", text: "Book a demo"
    assert_select "a[href^='mailto:contact@pipebird.io']"
    assert_select "img.brand-logo"
    assert_select "img.cta-logo"
    assert_select "link[rel='manifest'][href='/site.webmanifest']"
    assert_select "link[rel='icon'][href='/favicon.ico']"
    assert_select "link[rel='apple-touch-icon'][href='/apple-touch-icon.png']"
  end

  test "homepage renders crm integration detail sections" do
    get root_path

    assert_response :success
    assert_select "h2", text: "Why use Pipebird for CRM integration"
    assert_select "h2", text: "Why CRM Integration matters"
    assert_select "p", text: "Key benefits"
    assert_select "p", text: "Popular CRM integration scenarios"
    assert_select "p", text: "Compare the top CRM platforms"
    assert_select "p", text: "FAQs"
    assert_select ".faq-list details", minimum: 5
    assert_select ".scenario-grid article", minimum: 5
  end
end
