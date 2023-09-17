[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form = New-Object Windows.Forms.Form
$Form.Size = New-Object Drawing.Size @(300,100)
$Form.StartPosition = 'CenterScreen'
$Form.Text = "Hello, World!, GPO Test success"
$Label = New-Object Windows.Forms.Label
$Label.Location = New-Object Drawing.Point @(10,10)
$Label.Size = New-Object Drawing.Size @(280,20)
$Label.Text = "Hello, World!, GPO works"
$Form.Controls.Add($Label)
$Button = New-Object Windows.Forms.Button
$Button.Location = New-Object Drawing.Point @(110,40)
$Button.Size = New-Object Drawing.Size @(80,30)
$Button.Text = "OK"
$Button.DialogResult = [Windows.Forms.DialogResult]::OK
$Form.Controls.Add($Button)
$Form.AcceptButton = $Button

$result = $Form.ShowDialog()
