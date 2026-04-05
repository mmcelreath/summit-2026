# gui.ps1
# GUI for querying AD users

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Import-Module ActiveDirectory

# Create form
$form = New-Object System.Windows.Forms.Form
$form.Text = "AD User Query Tool"
$form.Size = New-Object System.Drawing.Size(600, 400)
$form.StartPosition = "CenterScreen"

# Search label
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10, 20)
$label.Size = New-Object System.Drawing.Size(100, 20)
$label.Text = "Search Filter:"
$form.Controls.Add($label)

# Search textbox
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(120, 20)
$textBox.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBox)

# Search button
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(330, 20)
$button.Size = New-Object System.Drawing.Size(75, 23)
$button.Text = "Search"
$form.Controls.Add($button)

# DataGridView for results
$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Location = New-Object System.Drawing.Point(10, 60)
$dataGridView.Size = New-Object System.Drawing.Size(560, 280)
$dataGridView.AutoSizeColumnsMode = "Fill"
$form.Controls.Add($dataGridView)

# Button click event
$button.Add_Click({
    $filter = $textBox.Text
    if ($filter -eq "") {
        $filter = "*"
    }
    try {
        $users = Get-ADUser -Filter { Name -like $filter } -SearchBase "OU=summit-users,DC=home,DC=lab" -Properties Name, SamAccountName, UserPrincipalName, Enabled
        $dataGridView.DataSource = $null
        $dataGridView.DataSource = $users | Select-Object Name, SamAccountName, UserPrincipalName, Enabled
        $dataGridView.Refresh()
        if ($users.Count -eq 0) {
            [System.Windows.Forms.MessageBox]::Show("No users found matching '$filter'", "No Results")
        }
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Error querying AD: $($_.Exception.Message)", "Error")
    }
})

# Show form
$form.ShowDialog()
