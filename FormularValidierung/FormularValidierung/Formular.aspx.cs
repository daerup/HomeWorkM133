namespace FormularValidierung {
    using System;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class Formular : Page {

        protected void DiscardEntries(object obj, EventArgs args)
        {
            this.username.Text = string.Empty;
            this.password.Text = string.Empty;
            this.passwordRepetition.Text = string.Empty;
            this.ipAddress.Text = string.Empty;
            this.score.Text = string.Empty;
            this.highscore.Text = string.Empty;
            this.primeNumber.Text = string.Empty;
        }

        protected void ValidatePrimeNumber(object obj, ServerValidateEventArgs args)
        {
            int number = Convert.ToInt32(args.Value);

            args.IsValid = this.IsPrime(number);
        }

        protected void ValidateUsername(object obj, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Length >= 5;
        }

        private bool IsPrime(int numberToCheck)
        {
            for (int i = 2; i < numberToCheck; i++)
            {
                if (numberToCheck % i == 0)
                {
                    return false;
                }
            }

            return true;
        }
    }
}