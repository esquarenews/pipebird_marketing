require "test_helper"

class HomepageTest < ActionDispatch::IntegrationTest
  test "homepage renders marketing content and placeholder logos" do
    get root_path

    assert_response :success
    assert_select "h1", "Ship customer data once. Pipebird keeps every tool in lockstep."
    assert_select ".logo-strip span", minimum: 6
    assert_select "a", text: "Book a demo"
    assert_select "a", text: "Request early access"
    assert_select "img.brand-logo"
    assert_select "img.cta-logo"
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
