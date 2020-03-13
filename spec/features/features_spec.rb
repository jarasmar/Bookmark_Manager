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
    Bookmark.create(title: 'Makers Academy', url:'http://www.makersacademy.com')
    Bookmark.create(title: 'Destroy Software', url: 'http://www.destroyallsoftware.com')
    Bookmark.create(title: 'Google', url: 'http://www.google.com')

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy Software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com")
  end
end

feature 'Adding bookmarks' do
  scenario 'an user can add a bookmark' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'https://testbookmark.com');")
    # Refactor:
    Bookmark.create(title: 'Test Book Mark', url: 'https://testbookmark.com')

    visit('/bookmarks/new')
    fill_in 'title', with: 'Test Book Mark'
    fill_in 'url', with: 'https://testbookmark.com'
    click_button 'Submit'
    expect(page).to have_link('Test Book Mark', href: 'https://testbookmark.com')
  end
end

feature 'Deleting bookmarks' do
  scenario 'an user can delete a bookmark' do
    Bookmark.create(title: 'Test Book Mark', url: 'https://testbookmark.com')
    visit('/bookmarks')
    expect(page).to have_link('Test Book Mark', href: 'https://testbookmark.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test Book Mark', href: 'https://testbookmark.com')
  end
end
