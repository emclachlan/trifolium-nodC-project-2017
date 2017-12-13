fasta=open('/Users/emilymclachlan/Library/Containers/com.apple.TextEdit/Data/Desktop/AG_1-72_copy.txt')
pullinglines=open('AG_1-244_renamed.fa','w')

for line in fasta:
	if line.startswith('>'):
		pullinglines.write(line)

fasta.close()
pullinglines.close()

