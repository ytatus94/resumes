import os, sys


bool_recruiter = True
bool_financial_sector = True
str_company_name = 'Parallel Partners'
str_company_name_brief = 'Parallel Partners'  # no special characters
str_company_address = 'Chicago, IL'

str_hiring_manager_name = 'Mr. Garcia'
#str_hiring_manager_name = None
str_position_title = 'Quantitative Research Analyst'


# Fill key words in the LaTex template file
if bool_financial_sector:
 f_cover_letter_template = open('template_cover_letter.tex',"r")
else:
 f_cover_letter_template = open('template_cover_letter_other_sector.tex',"r")
template_lines = f_cover_letter_template.readlines()

template_lines[14] = str_company_name
template_lines[16] = str_company_address
if str_hiring_manager_name == None:
 str_hiring_manager_name = 'Hiring Manager'
template_lines[20] = '\\opening{Dear ' + str_hiring_manager_name + ',} '
template_lines[28] = str_position_title.split(' ')[-1].lower() + "'s "
template_lines[34] = '\\textit{' + str_position_title + '} '
if(bool_recruiter == True):
 template_lines[36] = 'in this role. '
else: 
 template_lines[36] = 'at ' + str_company_name_brief + '. '

str_cover_letter_file_name = 'cover_letter_'
str_cover_letter_file_name = str_cover_letter_file_name + str_company_name_brief.replace(' ','_').replace('\&','_').replace('.','_')
str_cover_letter_file_name = str_cover_letter_file_name +'_' + str_position_title.replace(' ','_')  + '.tex' 
f_out =  open(str_cover_letter_file_name,'w')
for line in template_lines:
 f_out.write(line)
f_out.close()

# Compile the Tex file to generate cover letter in pdf
os.system('latex '+ str_cover_letter_file_name)
os.system('latex '+ str_cover_letter_file_name)
os.system('dvips '+ str_cover_letter_file_name.replace('.tex', ".dvi"))
os.system('ps2pdf '+ str_cover_letter_file_name.replace('.tex', ".ps"))


# Compile the resume Tex file
str_resume_file_name = 'resume.tex'
os.system('latex '+ str_resume_file_name)
os.system('latex '+ str_resume_file_name)
os.system('dvips '+ str_resume_file_name.replace('.tex', ".dvi"))
os.system('ps2pdf '+ str_resume_file_name.replace('.tex', ".ps"))

# Combine cover letter with resume
str_combined = 'Cheng_Hsien_Li_'
str_combined = str_combined + str_company_name_brief.replace(' ','_').replace('\&','_')
str_combined = str_combined + '_' + str_position_title.replace(' ','_')  + '.pdf' 
merge_command = 'pdfmerge '
merge_command = merge_command + str_cover_letter_file_name.replace('.tex', ".pdf") + ' '
merge_command = merge_command + str_resume_file_name.replace('.tex', ".pdf") + ' '
merge_command = merge_command + ' ' + str_combined
os.system(merge_command)

# Make new folder and copy pdfs over
if(bool_recruiter == True):
 str_folder_path = 'Recruiters/' + str_company_name_brief.replace(' ','_').replace('\&','_')
else:
 str_folder_path = 'Companies' + str_company_name_brief.replace(' ','_').replace('\&','_')

if(os.path.isdir(str_folder_path) == False):
 os.system('mkdir ' + str_folder_path)

os.system('mv -f ' + str_cover_letter_file_name.replace('.tex','.pdf') + ' ' +  str_folder_path)
os.system('mv -f ' + str_resume_file_name.replace('.tex','.pdf') + ' ' + str_folder_path)
os.system('mv -f ' + str_combined + ' ' + str_folder_path)
os.system('evince ' + str_folder_path + '/' + str_combined)



# Remove extra files generated 
os.system('rm '+ str_cover_letter_file_name)
os.system('rm '+ str_cover_letter_file_name.replace('.tex', ".ps"))
os.system('rm '+ str_cover_letter_file_name.replace('.tex', ".aux"))
os.system('rm '+ str_cover_letter_file_name.replace('.tex', ".dvi"))
os.system('rm '+ str_cover_letter_file_name.replace('.tex', ".log"))
os.system('rm '+ str_cover_letter_file_name.replace('.tex', ".out"))

os.system('rm '+ str_resume_file_name.replace('.tex', ".ps"))
os.system('rm '+ str_resume_file_name.replace('.tex', ".aux"))
os.system('rm '+ str_resume_file_name.replace('.tex', ".dvi"))
os.system('rm '+ str_resume_file_name.replace('.tex', ".log"))
os.system('rm '+ str_resume_file_name.replace('.tex', ".out")) 






