
feature 'Main Page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing bookmarks' do
  scenario 'I can see my bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
