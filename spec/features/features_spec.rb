require 'pg'

# feature 'Main Page' do
#   scenario 'visiting the index page' do
#     visit('/')
#     expect(page).to have_content 'Bookmark Manager'
#   end
# end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

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
