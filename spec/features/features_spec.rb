require 'pg'

# feature 'Main Page' do
#   scenario 'visiting the index page' do
#     visit('/')
#     expect(page).to have_content 'Bookmark Manager'
#   end
# end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    # Add the test data
    Bookmark.create(url:'http://www.makersacademy.com')
    Bookmark.create(url: 'http://www.destroyallsoftware.com')
    Bookmark.create(url: 'http://www.google.com')

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end

feature 'Adding bookmarks' do
  scenario 'an user can add a bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'https://testbookmark.com');")

    visit('/bookmarks/new')
    fill_in 'url', with: 'https://testbookmark.com'
    click_button 'Submit'
    expect(page).to have_content 'https://testbookmark.com'
  end
end
