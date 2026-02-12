require "test_helper"

class UseCasePagesTest < ActionDispatch::IntegrationTest
  test "crm integration page renders placeholder sections" do
    get crm_integration_path

    assert_response :success
    assert_select "h1", "CRM integration that keeps sales, product, and support perfectly aligned."
    assert_select "a[href='/heroku-connect-migration']", text: "Heroku Connect Migration"
    assert_select "a[href='/contact-us']", text: "Contact Us"
    assert_select ".feature-grid article", minimum: 4
    assert_select ".faq-list details", minimum: 3
  end

  test "heroku connect migration page renders migration phases" do
    get heroku_connect_migration_path

    assert_response :success
    assert_select "h1", "Heroku Connect migration without downtime surprises."
    assert_select ".scenario-grid article", minimum: 3
    assert_select ".pricing-table tbody tr", minimum: 3
    assert_select "a", text: "Request migration plan"
  end

  test "contact us page renders intake placeholders" do
    get contact_us_path

    assert_response :success
    assert_select "h1", "Tell us what you need to sync, and we will map a rollout plan."
    assert_select "form.contact-form"
    assert_select "input#full-name"
    assert_select "input#work-email"
    assert_select "textarea#notes"
    assert_select "a[href='mailto:contact@pipebird.io']"
  end
end
