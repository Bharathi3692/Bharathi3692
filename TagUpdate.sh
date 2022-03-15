Tag_Name="Cloud Support Party"
Tag_Value="TCS GSO Cloud Operations"
sub="Azure Pass - Sponsorship"

for sub_name in ${sub}
do
	az account set --name "$sub_name"
	group_id=$(az group list --subscription "$sub_name" --query [].id --output tsv)
   for RG_Id in ${group_id}
   do
	az tag update --resource-id $RG_Id --operation Merge --tags "$Tag_Name"="$Tag_Value"
	group=$(az group list --query "[?id=='$RG_Id'].name" --output tsv)
	res_id=$(az resource list --resource-group $group --query [].id --output tsv)
   for Rs_Id in ${res_id}
   do
	az tag update --resource-id $Rs_Id --operation Merge --tags "$Tag_Name"="$Tag_Value"
   done
   done
done
