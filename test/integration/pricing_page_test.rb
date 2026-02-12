require "test_helper"

class PricingPageTest < ActionDispatch::IntegrationTest
  test "pricing page renders plans and placeholder pricing details" do
    get pricing_path

    assert_response :success
    assert_select "h1", "Choose the plan that matches your integration volume."
    assert_select "[data-controller='billing-switcher']"
    assert_select ".billing-toggle button[data-billing-period='monthly'].is-active", text: "Monthly"
    assert_select ".billing-toggle button[data-billing-period='annual']", text: "Annual (save placeholder %)"
    assert_select "[data-billing-switcher-target='value'][data-monthly][data-annual]", minimum: 6
    assert_select ".plan-card", minimum: 3
    assert_select ".plan-card", text: /Placeholder/
    assert_select ".plan-card.featured .plan-badge", text: "Most popular"
    assert_match(/<p class="plan-name">Growth<\/p>\s*<h2>.*<\/h2>\s*<p class="plan-badge">Most popular<\/p>/m, @response.body)
    assert_select ".pricing-table thead th", minimum: 4
    assert_select ".pricing-table tbody tr", minimum: 5
    assert_select ".pricing-faq .faq-list details", minimum: 3
  end
end
