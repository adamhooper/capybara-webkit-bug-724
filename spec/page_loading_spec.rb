describe 'capybara-webkit', type: :feature do
  it 'should see content on first load' do
    visit('/a-page')
    expect(page.status_code).to eq(200)
    expect(page.html).not_to be_empty
  end

  it 'should see content on second load' do
    visit('/a-page')
    expect(page.status_code).to eq(304)
    expect(page.html).not_to be_empty
  end
end
