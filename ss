// Installieren Sie Cypress mit dem Befehl: npm install cypress --save-dev

// Importieren Sie das Cypress-Modul
import cy from 'cypress';

// Testfall für das Testen einer Anmeldeseite
describe('Anmeldeseite testen', () => {
  // Vor jedem Test besuchen Sie die Anmeldeseite
  beforeEach(() => {
    cy.visit('https://example.com/login');
  });

  // Test für eine erfolgreiche Anmeldung
  it('Erfolgreich anmelden', () => {
    // Geben Sie Benutzername und Passwort ein
    cy.get('input[name="username"]').type('IhrBenutzername');
    cy.get('input[name="password"]').type('IhrPasswort');

    // Klicken Sie auf die Anmeldetaste
    cy.get('button[type="submit"]').click();

    // Überprüfen Sie, ob die Anmeldung erfolgreich war
    cy.url().should('eq', 'https://example.com/dashboard');
  });    // Überprüfen Sie, ob eine Fehlermeldung angezeigt wird
    cy.get('.error-message').should('be.visible');
  });

  // Test für die Anzeige des Passwort-Wiederherstellungsformulars
  it('Anzeige des Passwort-Wiederherstellungsformulars', () => {
    // Klicken Sie auf den Link zum Passwort-Wiederherstellungsformular
    cy.get('a[href="/password-reset"]').click();

    // Überprüfen Sie, ob sich die URL geändert hat
    cy.url().should('eq', 'https://example.com/password-reset');

    // Überprüfen Sie, ob das Passwort-Wiederherstellungsformular vorhanden ist
    cy.get('form[name="password-reset-form"]').should('be.visible');
  });
});
