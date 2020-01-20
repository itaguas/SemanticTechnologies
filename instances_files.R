data <- read.csv("uniprot_sample.csv", header = T, sep =";")


###Function file
df1 <- data.frame (data$prot_function_indetifier_1, data$prot_function_1)
df2 <- data.frame (data$prot_function_indetifier_2, data$prot_function_3)
df3 <- data.frame (data$prot_function_indetifier_3, data$prot_function_3)
colnames(df1) <- c("id", "name")
colnames(df2) <- c("id", "name")
colnames(df3) <- c("id", "name")
df <- rbind(df1,df2,df3) 
df <- df[!duplicated(df$id),] #We eliminate functions with the same ID
df$id <- as.character(df$id)
df <- subset(df, df$id!="") #We eliminate the empty rows
write.table(df, "function.txt", row.names = F, col.names = F, sep = "\t")



###Genes file
data <- read.csv("uniprot_sample.csv", header = T, sep =";")
df <- data.frame (data$gene_identifier, data$gene_name)
df <- df[!duplicated(df$data.gene_identifier),]
df$data.gene_identifier <- as.character(df$data.gene_identifier)
df <- subset(df, df$data.gene_identifier!="")
df[,3] <- ""

#We add a third column containing the IDs of genes with the same name
for (i in 1:nrow(df)) {
  print (i)
  if (df[i,2] != "NULL") {
    for (j in 1:nrow(df)) {
      if (df[j,2] != "NULL") {
        if (df[i,2] == df[j,2]) {
          if(!(df[i,1]==df[j,1])) {
            df[i,3] <- paste0(df[i,3],"_", df[j,1])
          }
        }
      }
    }
  }
}

write.table(df, "gene_mod.txt", row.names = F, col.names = F, sep = "\t")



#Locations file
data <- read.csv("uniprot_sample.csv", header = T, sep =";")
df1 <- data.frame (data$prot_location_indetifier_1, data$prot_location_1)
df2 <- data.frame (data$prot_location_indetifier_2, data$prot_location_2)
df3 <- data.frame (data$prot_location_indetifier_3, data$prot_location_3)
colnames(df1) <- c("id", "name")
colnames(df2) <- c("id", "name")
colnames(df3) <- c("id", "name")
df <- rbind(df1,df2,df3)
df <- df[!duplicated(df$id),]
df <- subset(df, df$id!="")
write.table(df, "location.txt", row.names = F, col.names = F, sep = "\t")



#Processes file
data <- read.csv("uniprot_sample.csv", header = T, sep =";")
df1 <- data.frame (data$prot_process_indetifier_1, data$prot_process_1)
df2 <- data.frame (data$prot_process_indetifier_2, data$prot_process_2)
df3 <- data.frame (data$prot_process_indetifier_3, data$prot_process_3)
colnames(df1) <- c("id", "name")
colnames(df2) <- c("id", "name")
colnames(df3) <- c("id", "name")
df <- rbind(df1,df2,df3)
df <- df[!duplicated(df$id),]
df <- subset(df, df$id!="")
write.table(df, "process.txt", row.names = F, col.names = F, sep = "\t")



#Proteins file
df <- read.csv("uniprot_sample.csv", header = T, sep =";")

for (i in 1:nrow(df)) {
  print (i)
  for (j in 1:nrow(df)) {
    if (df[i,3] == df[j,3]) {
      if(!(df[i,1]==df[j,1])) {
        df[i,29] <- paste0(df[i,29],"_", df[j,1])
      }
    }
  }
}

write.table(df, "prots.txt", row.names = F, col.names = F, sep = "\t")


#Species file
data <- read.csv("uniprot_sample.csv", header = T, sep =";")
df <- data.frame (data$org_identifier, data$org_name)
df <- df[!duplicated(df$data.org_identifier),]
df$data.org_identifier <- as.character(df$data.org_identifier)
df <- subset(df, df$data.org_identifier!="")
df[,3] <- ""

#We add a third column containing the IDs of species with the same name
for (i in 1:nrow(df)) {
  print (i)
  for (j in 1:nrow(df)) {
    if (df[i,2] == df[j,2]) {
      if(!(df[i,1]==df[j,1])) {
        df[i,3] <- paste0(df[i,3],"_", df[j,1])
        df[j,3] <- paste0(df[j,3],"_", df[i,1])
      }
    }
  }
}

write.table(df, "species1.txt", row.names = F, col.names = F, sep = "\t")
