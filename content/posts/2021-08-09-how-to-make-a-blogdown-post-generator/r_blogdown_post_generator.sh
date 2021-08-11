#!/bin/bash
# Purpose:      Generate A Blank Blogdown Post
#		        with User Input for Front Matter
# Method:	Use a Bash-driven Template Generator
#
# Section_01:	Declare Function to Take User Input
# Author:       HannhM; #Freenode
# Date:		Sat 10 Apr 2021 13:00:00 NZST
#
# Section_02:	Import Front Matter to Blogdown Post
# Author:       Quid Agis under GPL v2.0+
# Date:         Mon Aug 09 2021 15:00:00 NZST
# Ver:          0.035
#
# Section_03:	Import Body Tags to Blogdown Post
# Author:       Quid Agis under GPL v2.0+
# Date:         Mon Aug 09 2021 18:15:00 NZST
# Ver:          0.010
#
# Section_04:	Directory Activity
# Author:       Quid Agis under GPL v2.0+
# Date:         Mon Aug 09 2021 18:29:34 NZST
# Ver:          0.005
# ------------------------------------------


#   Section_01
#
#   declare the function

_functioname ()
{
    local    _year _month _day _titleorigin _tag1 _tag2 _tag3 _draft _file

#   state purpose of script

    printf  "\n"
    printf  "# Generate a new Blogdown Post using READLINE in Bash \n"

#   state the required file format

    printf  "\n"
    printf  "# The filename must be: 'YYYY-MM-DD-this-is-a-new-post' \n"

#   get the Year

    printf  "\n"
    read -p "# What year (YYYY) ? " _year

#   get the Month

    printf  "\n"
    read -p "# What month (MM) ? " _month

#   get the Day

    printf  "\n"
    read -p "# What day (DD) ? " _day

#   get the file name

    printf  "\n"
    read -p "# What is the post title (This is a new post) ? " _titleorigin

    _titleorigin="${_titleorigin// /-}"

#   get the author name

    printf  "\n"
    read -p "# Who is the post author (Admin | Quid Agis) ? " _author

#   get the post tag1

    printf  "\n"
    read -p "# What is tag 1 (word) ? " _tag1

#   get the post tag2

    printf  "\n"
    read -p "# What is tag 2 (word) ? " _tag2

#   get the post tag3

    printf  "\n"
    read -p "# What is tag 3 (word) ? " _tag3

#   get the draft status

    printf  "\n"
    read -p "# Is this post a draft (yes | no) ? " _draft

#   build the filename

    # Uncomment the _file line below if you want to set the
    # absolute filepath to the generated blog post name + .Rmarkdown
    # _file="/home/quid/Git/quid-agis.github.io/content/posts/${_year}-${_month}-${_day}-${_titleorigin}.Rmarkdown"

    # Comment the line below if you uncomment the _file line above
    _file="index.Rmarkdown"

    # Create the file
    touch ${_file}


#   Section_02
#
#   import the front matter

    title_label=$(echo $_titleorigin | tr '-' ' ' | sed 's/[^ ]\+/\L\u&/g' | tr -d '')

    printf '%s\n' "---" >> ${_file}
    printf 'title: %s\n' "$title_label" >> ${_file}
    printf 'author: %s\n' "$_author" >> ${_file}
    printf 'date: %s %s %s\n' "'$_year-$_month-$_day'" >> ${_file}
    printf 'slug: []\n' >> ${_file}
    printf 'categories: [sysadmin]\n' >> ${_file}
    printf 'tags: %s %s %s\n' "[$_tag1, $_tag2, $_tag3]" >> ${_file}
    printf 'draft: %s\n' "$_draft" >> ${_file}
    printf '%s\n' "---" >> ${_file}


#   Section_03
#
#   import the body tags

    printf '\n' >> ${_file}
    printf '\n' >> ${_file}
    printf 'This is the first placeholder sentence at the top of the blog post, but below the front matter.\n' >> ${_file}
    printf 'This is the second placeholder sentence near the top of the blog post, but below the first sentence.\n' >> ${_file}
    printf 'This is the third placeholder sentence near the top of the blog post, but also the first sentence.\n' >> ${_file}

    printf '\n' >> ${_file}
    printf 'Three correct hyperlinks with working TITLE tags:\n' >> ${_file}
    printf '\n' >> ${_file}
    printf 'This is test [link 1][id01].\n\n' >> ${_file}
    printf 'This is test [link 2][id02].\n\n' >> ${_file}
    printf 'This is test [link 3][id03].\n\n' >> ${_file}
    printf '\n' >> ${_file}
    printf '\n' >> ${_file}
    printf '\n' >> ${_file}

    printf 'Three correct image links with working ALT_TEXT tags:\n' >> ${_file}
    printf '\n' >> ${_file}
    printf '![Look at this interesting image][id04]\n\n' >> ${_file}
    printf '![Look at this interesting image][id05]\n\n' >> ${_file}
    printf '![Look at this interesting image][id06]\n\n' >> ${_file}


    printf 'References:\n' >> ${_file}

    printf '* https://en.wikipedia.org/wiki/Wikipedia:Citing_sources\n' >> ${_file}
    printf '* https://en.wikipedia.org/wiki/Wikipedia:Citing_sources\n' >> ${_file}
    printf '* https://en.wikipedia.org/wiki/Wikipedia:Citing_sources\n' >> ${_file}
    printf '\n' >> ${_file}
    printf '[id01]: http://google.co.nz "This link leads to Google NZ"\n' >> ${_file}
    printf '[id02]: http://google.co.nz "This link leads to Google NZ"\n' >> ${_file}
    printf '[id03]: http://google.co.nz "This link leads to Google NZ"\n' >> ${_file}
    printf '[id04]: simple_placeholder_image_for_post_generator.png "This is a very interesting image of a black shape"\n\n' >> ${_file}
    printf '[id05]: simple_placeholder_image_for_post_generator.png "This is a very interesting image of a black shape"\n\n' >> ${_file}
    printf '[id06]: simple_placeholder_image_for_post_generator.png "This is a very interesting image of a black shape"\n' >> ${_file}
    printf '\n' >> ${_file}
    printf '\n' >> ${_file}
    printf '# EOF\n' >> ${_file}

#   Section_04
#
#   directory activity

    # Create fullpath directory
    _directory="/home/quid/Git/quid-agis.github.io/content/posts/${_year}-${_month}-${_day}-${_titleorigin}"
    mkdir -p ${_directory}

    # Copy the placeholder image to the new directory
    _image="simple_placeholder_image_for_post_generator.png"
    cp ${_image} ${_directory}

#   test the blog post generator

    printf  "\n"
    printf  "The new blog post filename is: ${_year}-${_month}-${_day}-${_titleorigin}.Rmarkdown"
    # printf  "\n"

    # Copy the generated blog post to the new directory
    cp -r ${_file} ${_directory}

    # Remove the generated blog post from the working directory
    rm -f ${_file}

    # Clear the screen
    exec /usr/bin/clear

    # Test to verify the directory & file created correctly. IF so, Success!!
    # Else, Failure!!

# Use your Editor of choice to edit from the command line
# /usr/bin/nano ${_file}
# /usr/bin/vim ${_file}

}


_functioname

# EOF
