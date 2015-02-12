namespace :eve do
  namespace :db do

    namespace :import do

      desc "Import skill books to current schema"
      task :skill_books => :environment do
        groups = SkillBookGroup.all
        groups.each do |group|
          books = MarketItem.where(:group_id => group.id)
          books.each do |book|
            group_id = book.group_id
            attributes = book.attributes
            attributes.delete("group_id")
            skill_book = SkillBook.new(attributes)
            skill_book.id = book.id
            skill_book.skill_book_group_id = group_id
            if skill_book.save
              puts "Saved skill book: #{skill_book.id}"
            else
              puts "Unable to save skill book: #{book.name}"
            end
          end
        end
      end

      desc "Update rank on skill books"
      task :update_rank => :environment do
        skill_books = SkillBook.all
        skill_books.each do |skill_book|
          puts "Starting: " + skill_book.name
          rank = skill_book.attrs.where(:attr_type_id => 275).first.value_float
          skill_book.rank = rank.to_i
          if skill_book.save
            puts skill_book.name + " saved"
          else
            puts skill_book.name + " not saved"
          end
        end
      end

      desc "Update the primary and secondary attributes"
      task :skill_attributes => :environment do
        ATTR_TYPES = {164 => "charisma", 165 => "intelligence", 166 => "memory", 167 => "perception", 168 => "willpower"}
        skill_books = SkillBook.all
        skill_books.each do |skill_book|
          primary = skill_book.attrs.where(:attr_type_id => 180).first.value_int || skill_book.attrs.where(:attr_type_id => 180).first.value_float
          secondary = skill_book.attrs.where(:attr_type_id => 181).first.value_int || skill_book.attrs.where(:attr_type_id => 181).first.value_float
          skill_book.primary_attribute = ATTR_TYPES[primary.to_i]
          skill_book.secondary_attribute = ATTR_TYPES[secondary.to_i]
          if skill_book.save
            puts skill_book.name + " saved ok"
          else
            puts skill_book.name + " failed to save"
          end
        end
      end
    end

  end
end
