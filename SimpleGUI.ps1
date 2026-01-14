Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'PowerShell GUI'
$form.Size = New-Object System.Drawing.Size(400, 300)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(50, 30)
$label.Size = New-Object System.Drawing.Size(300, 25)
$label.Text = 'Enter your name:'
$label.ForeColor = [System.Drawing.Color]::White
$label.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(50, 65)
$textBox.Size = New-Object System.Drawing.Size(300, 25)
$textBox.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$textBox.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$textBox.ForeColor = [System.Drawing.Color]::White
$form.Controls.Add($textBox)

$outputLabel = New-Object System.Windows.Forms.Label
$outputLabel.Location = New-Object System.Drawing.Point(50, 165)
$outputLabel.Size = New-Object System.Drawing.Size(300, 40)
$outputLabel.Text = ''
$outputLabel.ForeColor = [System.Drawing.Color]::FromArgb(220, 220, 220)
$outputLabel.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($outputLabel)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(50, 110)
$button.Size = New-Object System.Drawing.Size(100, 35)
$button.Text = 'Greet'
$button.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 204)
$button.ForeColor = [System.Drawing.Color]::White
$button.FlatStyle = 'Flat'
$button.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$button.Add_Click({
    if ($textBox.Text) {
        $outputLabel.Text = "Hello, $($textBox.Text)!"
    } else {
        $outputLabel.Text = 'Please enter a name.'
    }
})
$form.Controls.Add($button)

$clearButton = New-Object System.Windows.Forms.Button
$clearButton.Location = New-Object System.Drawing.Point(160, 110)
$clearButton.Size = New-Object System.Drawing.Size(100, 35)
$clearButton.Text = 'Clear'
$clearButton.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$clearButton.ForeColor = [System.Drawing.Color]::White
$clearButton.FlatStyle = 'Flat'
$clearButton.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$clearButton.Add_Click({
    $textBox.Text = ''
    $outputLabel.Text = ''
})
$form.Controls.Add($clearButton)

$statusStrip = New-Object System.Windows.Forms.StatusStrip
$statusStrip.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 204)
$statusLabel = New-Object System.Windows.Forms.ToolStripStatusLabel
$statusLabel.Text = 'Ready'
$statusLabel.ForeColor = [System.Drawing.Color]::White
$statusStrip.Items.Add($statusLabel)
$form.Controls.Add($statusStrip)

$form.Add_Shown({$textBox.Select()})
$form.ShowDialog()