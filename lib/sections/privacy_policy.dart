import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../i18n/i18n.dart';

/// Privacy Policy component rendered on the privacy page or section.
@client
class PrivacyPolicy extends StatelessComponent {
  const PrivacyPolicy({super.key});

  @override
  Component build(BuildContext context) {
    final lang = I18nScope.of(context).lang;

    return section(id: 'privacy', classes: 'privacy-section', [
      div(classes: 'container privacy-container', [
        div(classes: 'privacy-card glass-card', [
          div(classes: 'privacy-header', [
            a(
              href: '#',
              classes: 'back-link',
              onClick: () {
                if (kIsWeb) {
                  web.window.location.hash = '';
                }
              },
              [
                .text('← '),
                .text(lang == 'pt' ? 'Voltar para a página inicial' : (lang == 'es' ? 'Volver al inicio' : 'Back to home')),
              ],
            ),
            h1(classes: 'privacy-title', [
              .text(lang == 'pt' ? 'Política de Privacidade' : (lang == 'es' ? 'Política de Privacidad' : 'Privacy Policy')),
            ]),
            p(classes: 'privacy-updated', [
              .text(lang == 'pt' ? 'Última atualização: 28 de julho de 2026' : (lang == 'es' ? 'Última actualización: 28 de julio de 2026' : 'Last updated: July 28, 2026')),
            ]),
          ]),
          div(classes: 'privacy-body', [
            if (lang == 'pt') ..._buildPtContent() else if (lang == 'es') ..._buildEsContent() else ..._buildEnContent(),
          ]),
        ]),
      ]),
    ]);
  }

  List<Component> _buildEnContent() {
    return [
      p(classes: 'privacy-intro', [
        .text('Coinky ("the App") is a personal finance management app. This policy explains what data the App handles and how.'),
      ]),
      h2([.text('1. Data we do NOT collect')]),
      p([
        .text('Coinky does not require an account or login, and does not use analytics, advertising, or tracking SDKs. We do not collect your name, email, contacts, location, camera, microphone, or browsing history.'),
      ]),
      h2([.text('2. Data stored on your device')]),
      p([
        .text('All financial information you enter — transactions, categories, credit cards, budgets, and scheduled reminders — is stored locally in an encrypted-at-rest database on your device. This data is never transmitted to our servers, because we do not operate any servers that store your financial data. If you enable Face ID / biometric lock, the biometric check is performed entirely by your device\'s operating system; Coinky never receives or stores your biometric data.'),
      ]),
      h2([.text('3. Data shared with third parties')]),
      p([
        .text('Coinky uses RevenueCat to manage in-app purchases and subscriptions. When you make a purchase, a randomly generated identifier and your purchase/receipt information are sent to RevenueCat to validate your subscription. This identifier is not linked to your name, email, or financial data. See RevenueCat\'s privacy policy at '),
        a(href: 'https://www.revenuecat.com/privacy', target: Target.blank, attributes: {'rel': 'noopener'}, [.text('revenuecat.com/privacy')]),
        .text(' for details.'),
      ]),
      p([
        .text('If you use the "Export" or "Share" feature, the App hands the exported file (e.g., a CSV report) to your device\'s native share sheet. Where that file goes next (Mail, Files, WhatsApp, etc.) is entirely your choice — Coinky does not receive or see it.'),
      ]),
      p([
        .text('If you use the bank statement import (OFX) feature, the file you select is read locally on your device and only its contents are imported into your local database. It is never uploaded anywhere.'),
      ]),
      h2([.text('4. Data retention and deletion')]),
      p([
        .text('Because all data is stored locally, uninstalling the App or using the in-app "Clear Data" option permanently deletes your financial data from your device. We have no copy to delete on our end.'),
      ]),
      h2([.text('5. Children\'s privacy')]),
      p([
        .text('Coinky is not directed at children under 13 and does not knowingly collect data from them.'),
      ]),
      h2([.text('6. Changes to this policy')]),
      p([
        .text('We may update this policy from time to time. Continued use of the App after changes constitutes acceptance of the updated policy.'),
      ]),
      h2([.text('7. Contact')]),
      p([
        .text('Questions about this policy: '),
        a(
          href: '#form',
          onClick: () {
            if (kIsWeb) web.window.location.hash = '#form';
          },
          [.text('Contact Form')],
        ),
      ]),
    ];
  }

  List<Component> _buildPtContent() {
    return [
      p(classes: 'privacy-intro', [
        .text('O Coinky ("o Aplicativo") é um aplicativo de gestão de finanças pessoais. Esta política explica quais dados o Aplicativo trata e como.'),
      ]),
      h2([.text('1. Dados que NÃO coletamos')]),
      p([
        .text('O Coinky não exige conta ou login, e não utiliza SDKs de análise (analytics), publicidade ou rastreamento. Não coletamos seu nome, e-mail, contatos, localização, câmera, microfone ou histórico de navegação.'),
      ]),
      h2([.text('2. Dados armazenados no seu dispositivo')]),
      p([
        .text('Todas as informações financeiras que você insere — transações, categorias, cartões de crédito, orçamentos e lembretes agendados — são armazenadas localmente em um banco de dados no seu dispositivo. Esses dados nunca são transmitidos aos nossos servidores, pois não operamos servidores que armazenem seus dados financeiros. Se você ativar o bloqueio por Face ID / biometria, a verificação biométrica é realizada inteiramente pelo sistema operacional do seu dispositivo; o Coinky nunca recebe ou armazena seus dados biométricos.'),
      ]),
      h2([.text('3. Dados compartilhados com terceiros')]),
      p([
        .text('O Coinky utiliza o RevenueCat para gerenciar compras dentro do aplicativo e assinaturas. Ao realizar uma compra, um identificador gerado aleatoriamente e as informações da compra/recibo são enviados ao RevenueCat para validar sua assinatura. Esse identificador não está vinculado ao seu nome, e-mail ou dados financeiros. Consulte a política de privacidade do RevenueCat em '),
        a(href: 'https://www.revenuecat.com/privacy', target: Target.blank, attributes: {'rel': 'noopener'}, [.text('revenuecat.com/privacy')]),
        .text('.'),
      ]),
      p([
        .text('Se você usar o recurso "Exportar" ou "Compartilhar", o Aplicativo envia o arquivo exportado (por exemplo, um relatório em CSV) para a tela de compartilhamento nativa do seu dispositivo. O destino desse arquivo (Mail, Arquivos, WhatsApp, etc.) é escolha totalmente sua — o Coinky não recebe nem visualiza esse arquivo.'),
      ]),
      p([
        .text('Se você usar o recurso de importação de extrato bancário (OFX), o arquivo selecionado é lido localmente no seu dispositivo e apenas seu conteúdo é importado para o seu banco de dados local. Ele nunca é enviado a lugar nenhum.'),
      ]),
      h2([.text('4. Retenção e exclusão de dados')]),
      p([
        .text('Como todos os dados são armazenados localmente, desinstalar o Aplicativo ou usar a opção "Limpar Dados" dentro do app exclui permanentemente seus dados financeiros do seu dispositivo. Não mantemos nenhuma cópia para excluir de nosso lado.'),
      ]),
      h2([.text('5. Privacidade infantil')]),
      p([
        .text('O Coinky não é direcionado a crianças menores de 13 anos e não coleta dados intencionalmente delas.'),
      ]),
      h2([.text('6. Alterações nesta política')]),
      p([
        .text('Podemos atualizar esta política periodicamente. O uso continuado do Aplicativo após alterações constitui aceitação da política atualizada.'),
      ]),
      h2([.text('7. Contato')]),
      p([
        .text('Dúvidas sobre esta política: '),
        a(
          href: '#form',
          onClick: () {
            if (kIsWeb) web.window.location.hash = '#form';
          },
          [.text('Formulário de Contato')],
        ),
      ]),
    ];
  }

  List<Component> _buildEsContent() {
    return [
      p(classes: 'privacy-intro', [
        .text('Coinky ("la Aplicación") es una aplicación de gestión de finanzas personales. Esta política explica qué datos maneja la Aplicación y cómo.'),
      ]),
      h2([.text('1. Datos que NO recopilamos')]),
      p([
        .text('Coinky no requiere una cuenta o inicio de sesión, y no utiliza SDKs de análisis, publicidad o seguimiento. No recopilamos su nombre, correo electrónico, contactos, ubicación, cámara, micrófono o historial de navegación.'),
      ]),
      h2([.text('2. Datos almacenados en su dispositivo')]),
      p([
        .text('Toda la información financiera que ingresa (transacciones, categorías, tarjetas de crédito, presupuestos y recordatorios programados) se almacena localmente en una base de datos encriptada en su dispositivo. Estos datos nunca se transmiten a nuestros servidores, ya que no operamos servidores que almacenen sus datos financieros. Si habilita el bloqueo por Face ID / biometría, la verificación biométrica la realiza íntegramente el sistema operativo de su dispositivo; Coinky nunca recibe ni almacena sus datos biométricos.'),
      ]),
      h2([.text('3. Datos compartidos con terceros')]),
      p([
        .text('Coinky utiliza RevenueCat para gestionar las compras dentro de la aplicación y las suscripciones. Cuando realiza una compra, se envía un identificador generado aleatoriamente y la información de su compra/recibo a RevenueCat para validar su suscripción. Este identificador no está vinculado a su nombre, correo electrónico o datos financieros. Consulte la política de privacidad de RevenueCat en '),
        a(href: 'https://www.revenuecat.com/privacy', target: Target.blank, attributes: {'rel': 'noopener'}, [.text('revenuecat.com/privacy')]),
        .text(' para más detalles.'),
      ]),
      p([
        .text('Si utiliza la función "Exportar" o "Compartir", la Aplicación entrega el archivo exportado (por ejemplo, un informe CSV) a la hoja de uso compartido nativa de su dispositivo. El destino de ese archivo (Correo, Archivos, WhatsApp, etc.) es enteramente su elección; Coinky no lo recibe ni lo ve.'),
      ]),
      p([
        .text('Si utiliza la función de importación de extractos bancarios (OFX), el archivo que seleccione se lee localmente en su dispositivo y solo su contenido se importa a su base de datos local. Nunca se carga en ningún lugar.'),
      ]),
      h2([.text('4. Retención y eliminación de datos')]),
      p([
        .text('Debido a que todos los datos se almacenan localmente, desinstalar la Aplicación o usar la opción "Borrar datos" dentro de la aplicación elimina permanentemente sus datos financieros de su dispositivo. No tenemos ninguna copia que eliminar de nuestro lado.'),
      ]),
      h2([.text('5. Privacidad infantil')]),
      p([
        .text('Coinky no está dirigida a niños menores de 13 años y no recopila datos a sabiendas de ellos.'),
      ]),
      h2([.text('6. Cambios a esta política')]),
      p([
        .text('Podemos actualizar esta política de vez en cuando. El uso continuado de la Aplicación después de los cambios constituye la aceptación de la política actualizada.'),
      ]),
      h2([.text('7. Contacto')]),
      p([
        .text('Preguntas sobre esta política: '),
        a(
          href: '#form',
          onClick: () {
            if (kIsWeb) web.window.location.hash = '#form';
          },
          [.text('Formulario de Contacto')],
        ),
      ]),
    ];
  }
}
